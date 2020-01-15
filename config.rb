# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

set :markdown_engine, :kramdown
set :relative_links, false
set :strip_index_file, false
configure :build do
  set :http_prefix, "/hiraoka_labo/homcloud"
  #set :http_prefix, "/hiraoka_labo/homcloud-test"
end



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
page '/cli-doc/*', layout: 'cli-doc'

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

helpers do
  def navlink(name, urlbase, postfix="")
    lang = current_page.data.lang
    case lang
    when "ja", nil
      return link_to(name, "/#{urlbase}.html#{postfix}")
    else
      return link_to(name, "/#{urlbase}.#{lang}.html#{postfix}")
    end
  end

  def link_to_python_api
    %[<a href="#{config[:http_prefix]}/python-api/index.html">Python Interface API</a>]
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
