# Magic Marco website

Jekyll source for <https://magicmarco.co.uk>, published with GitHub Pages.

## Canonical domain

The canonical hostname is `https://magicmarco.co.uk`.

- `CNAME` contains `magicmarco.co.uk`.
- `_config.yml` sets `url: https://magicmarco.co.uk` and `baseurl: ""`.
- Internal links and assets should use Jekyll's `relative_url` filter.
- Canonical URLs, sitemap entries and form redirects should use `absolute_url`.

## Local setup

Install Ruby and Bundler, then install the GitHub Pages dependency set:

```sh
bundle install
```

Serve the site locally:

```sh
bundle exec jekyll serve
```

Build the production output:

```sh
JEKYLL_ENV=production bundle exec jekyll build
```

The generated site is written to `_site/`, which is intentionally ignored.

## Quality checks

Run the same checks used by CI:

```sh
JEKYLL_ENV=production bundle exec jekyll build --strict_front_matter
ruby scripts/check_internal_links.rb _site
ruby scripts/check_html_basics.rb _site
ruby scripts/check_spelling.rb
ruby scripts/check_launch_output.rb _site
```
