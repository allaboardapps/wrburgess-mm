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
    xml.itunes :summary, "A pragmatic podcast about leadership, product dev, and tech decisions between two recovering Chief Technology Officers."
    xml.itunes :subtitle, "A pragmatic podcast about leadership, product dev, and tech decisions between two recovering Chief Technology Officers."
    xml.itunes :type, "episodic"
    xml.itunes :image, href: "https://s3.amazonaws.com/cto-think-podcast-assets/cto-think-logo-itunes.jpg"
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
    xml.itunes :category, text: "Education" do
      xml.itunes :category, text: "Training"
    end
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
          xml.itunes :duration, text: article.data.duration
          xml.itunes :episodeType, "full"
          xml.summary do
            xml.cdata! article.data.summary
          end
          xml.description do
            xml.cdata! article.body
          end
          xml.enclosure url: podcast_file_url(article.data.audio_file_name), length: "37934213", type: "audio/mp3"
          xml.link podcast_file_url(article.data.audio_file_name)
          xml.guid({ isPermaLink: false }, SecureRandom.uuid)
        end
      end
    end
  end
end
