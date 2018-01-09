xml.instruct!
xml.rss(
  "version" => "2.0"
) do
  xml.channel do
    xml.title config[:site_name]
    xml.description config[:site_description]
    xml.language "en-us"
    xml.pubDate Time.rfc2822(blog.articles.first.date.strftime("%a, %d %b %Y %H:%M:%S %z"))
    xml.lastBuildDate Time.rfc2822(blog.articles.first.date.strftime("%a, %d %b %Y %H:%M:%S %z"))
    xml.link config[:site_url]
    xml.copyright config[:site_copyright]
    xml.author config[:site_email]

    blog.articles.each do |article|
      if article.data.published
        xml.item do
          xml.title article.title
          xml.author config[:site_name]
          xml.id article.data.id
          xml.published Time.rfc2822(article.date.strftime("%a, %d %b %Y %H:%M:%S %z"))
          xml.pubDate Time.rfc2822(article.date.strftime("%a, %d %b %Y %H:%M:%S %z"))
          xml.updated Time.rfc2822(article.date.strftime("%a, %d %b %Y %H:%M:%S %z"))
          xml.enclosure url: cdn_file_url(article.data.audio_file_name), length: article.data.file_size_bytes, type: article.data.file_type
          xml.link "#{config[:site_url]}#{article.url}"
          xml.guid({ isPermaLink: false }, cdn_file_url(article.data.audio_file_name))
        end
      end
    end
  end
end
