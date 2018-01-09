xml.instruct!
xml.rss(
  "xmlns:atom" => "http://www.w3.org/2005/Atom",
  "version" => "2.0"
) do
  xml.channel do
    xml.title config[:site_name]
    xml.description config[:site_description]
    xml.language "en-us"
    xml.pubDate blog.articles.first.date.strftime("%a, %d %b %Y %H:%M:%S %z")
    xml.lastBuildDate blog.articles.first.date.strftime("%a, %d %b %Y %H:%M:%S %z")
    xml.link config[:site_url]
    xml.copyright config[:site_copyright]
    xml.tag! "atom:link", href: "https://www.ctothink.com/rss2.xml", rel: "self", type: "application/rss+xml"

    blog.articles.each do |article|
      if article.data.published
        xml.item do
          xml.title article.title
          xml.author "#{config[:site_email]} (config[:site_name])"
          xml.pubDate article.date.strftime("%a, %d %b %Y %H:%M:%S %z")
          xml.enclosure url: cdn_file_url(article.data.audio_file_name), length: article.data.file_size_bytes, type: article.data.file_type
          xml.link "#{config[:site_url]}#{article.url}"
          xml.guid(cdn_file_url(article.data.audio_file_name))
          xml.description do
            xml.cdata! article.summary
          end
        end
      end
    end
  end
end
