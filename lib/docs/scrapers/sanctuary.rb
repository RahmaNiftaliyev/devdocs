module Docs

  class Sanctuary < UrlScraper
    self.name = "Sanctuary"
    self.slug = "sanctuary"
    self.type = "sanctuary"
    self.release = "3.1.0"
    self.base_url = "https://sanctuary.js.org/"
    self.links = {
      home: "https://sanctuary.js.org/",
      code: "https://github.com/sanctuary-js/sanctuary",
    }

    html_filters.push("sanctuary/entries")
    html_filters.push("sanctuary/clean_html")

    options[:title] = "Sanctuary"
    options[:attribution] = "Licensed under the MIT License."

    def get_latest_version(opts)
      get_npm_version("sanctuary", opts)
    end

    private

    def parse(response) # Hook here because Nokogori removes whitespace from textareas
      response.body.gsub! %r{<div class="output"[^>]*>([\W\w]+?)</div>}, '<pre class="output">\1</pre>'
      super
    end

  end

end
