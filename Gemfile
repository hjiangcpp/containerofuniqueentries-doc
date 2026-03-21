source "https://rubygems.org"

# Manage the Jekyll version to ensure consistency across environments.
# Uncomment and modify the following line to specify a Jekyll version:
# gem "jekyll", "~> 3.10.0"

# Default theme for new Jekyll sites. Change this if you use a different theme.
gem "minima", "~> 2.0"

# Use GitHub Pages integration. If using this, ensure the above `jekyll` gem is commented.
gem "github-pages", group: :jekyll_plugins

# Jekyll plugins for additional functionality.
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.6"
  gem "jekyll-remote-theme" # Enables remote themes.
  gem "jekyll-last-modified-at" # Adds last modified timestamps to pages.
end

# Gems for Windows and JRuby compatibility.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3" # Time zone support.
  gem "tzinfo-data" # Provides timezone data for Windows.
end

# Optional performance booster for Windows file watching.
# Uncomment if you experience slow rebuilds on Windows:
# gem "wdm", "~> 0.1.0", install_if: Gem.win_platform?

# GFM parser for kramdown v2. Needed for GitHub-flavored Markdown support.
gem "kramdown-parser-gfm"

# Lock `http_parser.rb` to version `0.6.x` for JRuby compatibility.
gem "http_parser.rb", "~> 0.6.0", platforms: [:jruby]

# HTTP request retries for robustness (used by some plugins or themes).
gem "faraday-retry"
