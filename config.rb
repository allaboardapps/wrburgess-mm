require "tzinfo"
Time.zone = "America/New_York"

# redirect "/rss2.xml", to: "/rss.xml"

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# Global Variables
set :site_description, "I'm Randy Burgess, a developer, manager, instructor, and podcaster based out of Chicago."
set :site_name, "Randy Burgess"
set :site_acronym, "RB"
set :site_email, "wrburgess@wrburgess.com"
set :site_url, "https://www.wrburgess.com"
set :site_copyright, "© 1998-2018 Randy Burgess. All Rights Reserved."
set :ga_id, "UA-822080-24"

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_css
  activate :minify_javascript
end

activate :blog do |blog|
  blog.sources = "posts/{year}-{month}-{day}-{id}.html"
  blog.permalink = "posts/{year}-{month}-{day}-{id}.html"
  blog.layout = "posts"
  blog.summary_separator = /READMORE/
end

activate :asset_hash
activate :livereload
activate :gzip
activate :sprockets

if defined? RailsAssets
  RailsAssets.load_paths.each do |path|
    sprockets.append_path path
  end
end

set(:port, 3000)

helpers do
  def image_url(file_name)
    "#{config[:site_url]}/images/#{file_name}"
  end
end

