# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

set :markdown_engine, :kramdown
set :relative_links, false
set :strip_index_file, false
configure :build do
  set :http_prefix, "/"
end

config.ignored_sitemap_matchers[:partials] = proc do |file|
  ignored = false

  file[:relative_path].ascend do |f|
    if f.to_s.start_with?("python-api/")
      ignored = false
      break
    elsif f.basename.to_s =~ %r{^_[^_]}
      ignored = true
      break
    end
  end

  ignored
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
page '/misc/ph-nmf-figures/*', layout: 'plain'
page '/hyperorder-book-ph/*', layout: 'empty'

page 'README.html', layout: false
page 'NEWS.html', layout: false
     
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
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
