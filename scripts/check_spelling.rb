#!/usr/bin/env ruby
# frozen_string_literal: true

require "find"

CHECKED_EXTENSIONS = %w[.md .html .yml .yaml .txt].freeze
IGNORED_DIRS = %w[.git _site .jekyll-cache .bundle node_modules vendor].freeze
IGNORED_FILES = %w[CONTENT_FACT_CHECK.md EDITORIAL_STYLE_GUIDE.md SITE_IMPROVEMENT_PLAN.md].freeze

DENYLIST = {
  /\bBryan May\b/i => "Use Brian May.",
  /\bnewly weds\b/i => "Use newlyweds.",
  /\bmore then\b/i => "Use more than.",
  /\bbar mitzva\b/i => "Use bar mitzvah.",
  /\bclose up magic\b/i => "Use close-up magic when it modifies a noun.",
  /\bstand up magic\b/i => "Use stand-up magic when it modifies a noun.",
  /\bset-up\b/i => "Use set up as the verb form."
}.freeze

errors = []

Find.find(".") do |path|
  if File.directory?(path)
    Find.prune if IGNORED_DIRS.include?(File.basename(path))
    next
  end

  next if IGNORED_FILES.include?(File.basename(path))
  next unless CHECKED_EXTENSIONS.include?(File.extname(path))

  text = File.read(path)
  DENYLIST.each do |pattern, message|
    text.scan(pattern) do
      line = text[0...Regexp.last_match.begin(0)].count("\n") + 1
      errors << "#{path}:#{line}: #{message}"
    end
  end
end

if errors.any?
  warn errors.uniq.sort.join("\n")
  abort "#{errors.uniq.length} spelling/style issue(s)"
end

puts "Spelling/style denylist looks good."
