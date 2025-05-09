source "https://rubygems.org"

# 使用 Jekyll 3.9.3，它与 Ruby 3.3.4 更兼容
gem "jekyll", "~> 3.9.3"
gem "minima", "~> 2.5"

# 添加 Ruby 3.4 将不再默认包含的依赖项
gem "csv"
gem "base64"
gem "bigdecimal"

# Jekyll 3.9 需要 kramdown-parser-gfm
gem "kramdown-parser-gfm"

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-paginate"
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
  gem "jekyll-archives"
  gem "jekyll-redirect-from"
  gem "jemoji"
  gem "jekyll-gist"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]

# 添加 webrick，因为它在 Ruby 3.0+ 中不再是标准库的一部分
gem "webrick"

# 添加 html-proofer 用于测试生成的站点
gem "html-proofer"
