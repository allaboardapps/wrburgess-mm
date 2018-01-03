require "securerandom"
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
    xml.atom :linkhref, "https://www.ctothink.com/rss.xml"
    xml.title "CTO Think"
    xml.description "A pragmatic podcast about leadership, product dev, and tech decisions between two recovering Chief Technology Officers."
    xml.language "en-us"
    xml.updated blog.articles.last.date.to_time.iso8601
    xml.pubDate blog.articles.first.date.to_time.iso8601
    xml.lastBuildDate blog.articles.first.date.to_time.iso8601
    xml.link "https://www.ctothink.com"
    xml.author do
      xml.name "CTO Think"
    end
    xml.copyright "Copyright 2017-2018 CTO Think. All Rights Reserved."
    xml.itunes :author, "CTO Think"
    xml.itunes :email, "hosts@ctothink.com"
    xml.googleplay :author, "CTO Think"
    xml.googleplay :email, "hosts@ctothink.com"
    xml.itunes :summary, "A pragmatic podcast about leadership, product dev, and tech decisions between two recovering Chief Technology Officers."
    xml.googleplay :description, "A pragmatic podcast about leadership, product dev, and tech decisions between two recovering Chief Technology Officers."
    xml.itunes :subtitle, "A pragmatic podcast about leadership, product dev, and tech decisions between two recovering Chief Technology Officers."
    xml.itunes :type, "episodic"
    xml.itunes :image, href: "https://s3.amazonaws.com/cto-think-podcast-assets/cto-think-logo-itunes.jpg"
    xml.googleplay :image, href: "https://s3.amazonaws.com/cto-think-podcast-assets/cto-think-logo-itunes.jpg"
    xml.itunes :keywords, "technology, business, leadership, management, cto, executive"
    xml.itunes :owner do
      xml.itunes :name, "CTO Think"
      xml.itunes :email, "hosts@ctothink.com"
    end
    xml.itunes :category, text: "Technology" do
      xml.itunes :category, text: "Tech News"
    end
    xml.itunes :category, text: "Business" do
      xml.itunes :category, text: "Management & Marketing"
    end
    xml.googleplay :category, text: "Technology"
    xml.itunes :explicit, "no"

    blog.articles.each do |article|
      if article.data.published
        xml.item do
          xml.title article.title
          xml.author "CTO Think"
          xml.id article.data.id
          xml.published article.date.to_time.iso8601
          xml.pubDate article.date.to_time.iso8601
          xml.updated article.date.to_time.iso8601
          xml.itunes :block, article.data.block
          xml.googleplay :block, article.data.block
          xml.itunes :order, article.data.id
          xml.itunes :author, "CTO Think"
          xml.itunes :email, "hosts@ctothink.com"
          xml.googleplay :author, "CTO Think"
          xml.googleplay :email, "hosts@ctothink.com"
          xml.itunes :image, href: "https://s3.amazonaws.com/cto-think-podcast-assets/cto-think-logo-itunes.jpg"
          xml.googleplay :image, href: "https://s3.amazonaws.com/cto-think-podcast-assets/cto-think-logo-itunes.jpg"
          xml.itunes :duration, text: article.data.duration
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
          xml.enclosure url: podcast_file_url(article.data.audio_file_name), length: article.data.file_length, type: article.data.file_type
          xml.link "https://www.ctothink.com#{article.url}"
          xml.guid({ isPermaLink: false }, podcast_file_url(article.data.audio_file_name))
        end
      end
    end
  end
end
