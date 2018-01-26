xml.instruct!
xml.rss(
  "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",
  "xmlns:dc" => "http://purl.org/dc/elements/1.1/",
  "xmlns:sy" => "http://purl.org/rss/1.0/modules/syndication/",
  "xmlns:admin" => "http://webns.net/mvcb/",
  "xmlns:rdf" => "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
  "xmlns:content" => "http://purl.org/rss/1.0/modules/content/",
  "xmlns:googleplay" => "http://www.google.com/schemas/play-podcasts/1.0",
  "xmlns:atom" => "http://www.w3.org/2005/Atom",
  "version" => "2.0"
) do
  xml.channel do
    xml.tag! "atom:link", href: "https://www.ctothink.com/rss.xml", rel: "self", type: "application/rss+xml"
    xml.title config[:site_name]
    xml.description config[:site_description]
    xml.language "en-us"
    xml.updated blog.articles.first.date.to_time.iso8601
    xml.pubDate blog.articles.first.date.to_time.iso8601
    xml.lastBuildDate blog.articles.first.date.to_time.iso8601
    xml.link config[:site_url]
    xml.author do
      xml.name config[:site_name]
    end
    xml.copyright config[:site_copyright]
    xml.itunes :author, config[:site_name]
    xml.itunes :email, config[:site_email]
    xml.googleplay :author, config[:site_name]
    xml.googleplay :email, config[:site_email]
    xml.itunes :summary,  config[:site_description]
    xml.googleplay :description,  config[:site_description]
    xml.itunes :subtitle,  config[:site_description]
    xml.itunes :type, "episodic"
    xml.itunes :image, href: "#{config[:cdn_url]}/cto-think-logo-itunes.jpg"
    xml.googleplay :image, href: "#{config[:cdn_url]}/cto-think-logo-itunes.jpg"
    xml.itunes :keywords, "technology, business, leadership, management, cto, executive"
    xml.itunes :owner do
      xml.itunes :name, config[:site_name]
      xml.itunes :email, config[:site_email]
    end
    xml.itunes :category, text: "Technology" do
      xml.itunes :category, text: "Tech News"
    end
    xml.itunes :category, text: "Business" do
      xml.itunes :category, text: "Management & Marketing"
    end
    xml.itunes :category, text: "Business" do
      xml.itunes :category, text: "Careers"
    end
    xml.googleplay :category, text: "Technology"
    xml.itunes :explicit, "no"

    blog.articles.each_with_index do |article, index|
      if article.data.published
        order_number = index + 1

        xml.item do
          xml.title "#{article.data.id}: #{article.title}"
          xml.author config[:site_name]
          xml.id article.data.id
          xml.published article.date.to_time.iso8601
          xml.pubDate article.date.to_time.iso8601
          xml.updated article.date.to_time.iso8601
          xml.itunes :block, article.data.block
          xml.googleplay :block, article.data.block
          xml.itunes :order, order_number
          xml.itunes :author, config[:site_name]
          xml.itunes :email, config[:site_email]
          xml.googleplay :author, config[:site_name]
          xml.googleplay :email, config[:site_email]
          xml.image href: "#{config[:cdn_url]}/cto-think-logo-itunes.jpg"
          xml.itunes :image, href: "#{config[:cdn_url]}/cto-think-logo-itunes.jpg"
          xml.googleplay :image, href: "#{config[:cdn_url]}/cto-think-logo-itunes.jpg"
          xml.duration article.data.duration
          xml.itunes :duration, article.data.duration
          xml.itunes :episodeType, "full"
          xml.itunes :episode, article.data.id
          xml.itunes :explicit, article.data.explicit
          xml.googleplay :explicit, article.data.explicit
          xml.itunes :keywords, article.data.keywords
          xml.googleplay :description do
            xml.cdata! article.body
          end
          xml.itunes :subtitle do
            xml.cdata! article.body
          end
          xml.itunes :summary do
            xml.cdata! article.body
          end
          xml.description do
            xml.cdata! article.body
          end
          xml.enclosure url: article.data.soundcloud_link, length: article.data.file_size_bytes, type: article.data.file_type
          xml.link "#{config[:site_url]}#{article.url}"
          xml.guid article.data.guid
        end
      end
    end
  end
end
