#!/usr/bin/env ruby
# frozen_string_literal: true

site_dir = ARGV.fetch(0, "_site")
abort "Missing build directory: #{site_dir}" unless Dir.exist?(site_dir)

canonical_host = "https://magicmarco.co.uk"
errors = []

Dir.glob(File.join(site_dir, "**", "*.html")).each do |path|
  html = File.read(path)
  relative = path.delete_prefix(site_dir)

  errors << "#{relative}: missing <title>" unless html.match?(%r{<title>.+?</title>}im)

  canonical = html[%r{<link\s+rel=["']canonical["']\s+href=["']([^"']+)["']}i, 1]
  if canonical.nil?
    errors << "#{relative}: missing canonical URL"
  elsif !canonical.start_with?(canonical_host)
    errors << "#{relative}: canonical URL is not on #{canonical_host}: #{canonical}"
  elsif canonical.match?(%r{\A#{Regexp.escape(canonical_host)}//})
    errors << "#{relative}: canonical URL contains a double slash after the hostname"
  end

  html.scan(%r{<img\b[^>]*>}i).each do |tag|
    errors << "#{relative}: image missing alt attribute: #{tag}" unless tag.match?(/\salt=["'][^"']*["']/i)
  end

  html.scan(%r{https://magicmarco\.co\.uk//[^\s"'<>]+}).each do |url|
    errors << "#{relative}: double slash URL: #{url}"
  end
end

if errors.any?
  warn errors.uniq.sort.join("\n")
  abort "#{errors.uniq.length} HTML quality issue(s)"
end

puts "HTML basics look good."
