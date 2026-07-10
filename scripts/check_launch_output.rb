#!/usr/bin/env ruby
# frozen_string_literal: true

site_dir = ARGV.fetch(0, "_site")
abort "Missing build directory: #{site_dir}" unless Dir.exist?(site_dir)

errors = []

generated_files = Dir.glob(File.join(site_dir, "**", "*")).select { |path| File.file?(path) }
removed_location_pattern = /location-magician|guildford-magician|_location/i

generated_files.each do |path|
  next unless File.binread(path).match?(removed_location_pattern)

  errors << "#{path.delete_prefix("#{site_dir}/")}: contains removed location-page reference"
end

sitemap_path = File.join(site_dir, "sitemap.xml")
if File.exist?(sitemap_path)
  sitemap = File.read(sitemap_path)
  urls = sitemap.scan(%r{<loc>(.*?)</loc>}).flatten

  duplicate_urls = urls.select { |url| urls.count(url) > 1 }.uniq
  duplicate_urls.each { |url| errors << "sitemap.xml: duplicate URL #{url}" }

  urls.each do |url|
    errors << "sitemap.xml: unwanted card URL #{url}" if url.include?("/card/")
    errors << "sitemap.xml: unwanted thanks URL #{url}" if url.include?("/thanks/")
    errors << "sitemap.xml: non-canonical hostname #{url}" unless url.start_with?("https://magicmarco.co.uk/")
  end

  errors << "sitemap.xml: contains stale 2021 timestamp" if sitemap.include?("2021")
else
  errors << "sitemap.xml: missing from generated output"
end

if errors.any?
  warn errors.sort.join("\n")
  abort "#{errors.length} launch output issue(s)"
end

puts "Launch output checks look good."
