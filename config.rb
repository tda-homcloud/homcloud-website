# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

set :markdown_engine, :kramdown

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

helpers do
  def navlink(name, urlbase, postfix="")
    lang = current_page.data.lang
    case lang
    when "ja", nil
      return link_to(name, "#{urlbase}.html#{postfix}")
    else
      return link_to(name, "#{urlbase}.#{lang}.html#{postfix}")
    end
  end

  def lab_url
    case current_page.data.lang
    when "ja", nil
      "http://www.wpi-aimr.tohoku.ac.jp/hiraoka_labo/index.html"
    else # including "en"
      "http://www.wpi-aimr.tohoku.ac.jp/hiraoka_labo/index-english.html"
    end
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
