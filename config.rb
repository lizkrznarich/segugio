###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Load data
activate :data_source do |c|
  c.root = 'source/data'
  c.files = [
    "authors.json",
    "links.json",
    "schemas.json"
  ]
end

# Use sprockets for asset compilation
activate :sprockets
sprockets.append_path File.join(root, 'vendor', 'bower_components')

# Set markdown template engine
# set :markdown_engine, :pandoc
set :markdown, smartypants: true

# put configuration variables into .env file
activate :dotenv

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def stage?
    ENV['RACK_ENV'] == "stage"
  end
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
end
