xml.instruct!
xml.urlset(
  "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9",
  "xmlns:image" => "http://www.google.com/schemas/sitemap-image/1.1",
  "xmlns:video" => "http://www.google.com/schemas/sitemap-video/1.1"
) do
  xml.url do
    xml.loc config[:site_url]
    blog.articles.each do |article|
      if article.data.published
        xml.loc "#{config[:site_url]}#{article.url}"
      end
    end
  end
end
