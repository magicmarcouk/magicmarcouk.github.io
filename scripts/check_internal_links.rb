#!/usr/bin/env ruby
# frozen_string_literal: true

require "set"
require "uri"

site_dir = ARGV.fetch(0, "_site")
abort "Missing build directory: #{site_dir}" unless Dir.exist?(site_dir)

files = Dir.glob(File.join(site_dir, "**", "*")).select { |path| File.file?(path) }
html_files = files.select { |path| path.end_with?(".html") }

known_paths = Set.new
files.each do |path|
  relative = path.delete_prefix(site_dir).sub(%r{\A/}, "")
  known_paths << "/#{relative}"
  known_paths << "/#{File.dirname(relative)}/" if File.basename(relative) == "index.html"
end
known_paths << "/"

external_schemes = %w[http https mailto tel data javascript]
errors = []

def page_url_for(path, site_dir)
  relative = path.delete_prefix(site_dir).sub(%r{\A/}, "")
  return "/" if relative == "index.html"
  return "/#{File.dirname(relative)}/" if File.basename(relative) == "index.html"

  "/#{relative}"
end

def normalise_internal_url(raw, current_url)
  clean = raw.split("#", 2).first.to_s.split("?", 2).first
  return nil if clean.empty?

  if clean.start_with?("/")
    clean
  else
    URI.join("https://example.test#{current_url}", clean).path
  end
end

html_files.each do |path|
  html = File.read(path)
  current_url = page_url_for(path, site_dir)

  html.scan(/\b(?:href|src)=["']([^"']+)["']/i).flatten.each do |raw|
    next if raw.start_with?("#")

    scheme = raw[/\A([a-z][a-z0-9+.-]*):/i, 1]&.downcase
    next if external_schemes.include?(scheme)
    next if raw.start_with?("//")

    target = normalise_internal_url(raw, current_url)
    next if target.nil?

    errors << "#{current_url} references missing #{raw}" unless known_paths.include?(target)
  end
end

if errors.any?
  warn errors.uniq.sort.join("\n")
  abort "#{errors.uniq.length} broken internal link or asset reference(s)"
end

puts "Internal links and assets look good."
