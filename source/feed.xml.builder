# xml.instruct!
xml.feed(
  "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",
  "xmlns:dc" => "http://purl.org/dc/elements/1.1/",
  "xmlns:sy" => "http://purl.org/rss/1.0/modules/syndication/",
  "xmlns:admin" => "http://webns.net/mvcb/",
  "xmlns:rdf" => "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
  "xmlns:content" => "http://purl.org/rss/1.0/modules/content/",
  "xmlns:googleplay" => "http://www.google.com/schemas/play-podcasts/1.0",
  "version" => "2.0",
  "xmlns:atom" => "http://www.w3.org/2005/Atom",
  "encoding" => "UTF-8"
) do
  xml.channel do
    xml.title "CTO Think"
    xml.description "The podcast description"
    xml.link "href" => "https://www.ctothink.com/feed.xml", "rel" => "self"
    xml.updated blog.articles.first.date.to_time.iso8601
    xml.author do
      xml.name "Don VanDemark and Randy Burgess"
    end
    xml.language "en-us"
    xml.copyright "Copyright 2017-2018 CTO Think. All Rights Reserved."
    xml.lastBuildDate blog.articles.first.date.to_time.iso8601
    xml.atom :linkhref, "https://www.ctothink.com/feed.xml"
    xml.itunes :author, "Don VanDemark and Randy Burgess"
    xml.itunes :subtitle, "CTO Think podcast subtitle"
    xml.itunes :summary, "CTO Think podcast summary"
    xml.itunes :type, "episodic"
    xml.itunes :image, href: "https://cdn.com/logo.jpg"
    xml.itunes :owner do
      xml.itunes :name, "Don VanDemark and Randy Burgess"
      xml.itunes :email, "advice@ctothink.com"
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
      xml.item do
        xml.title article.title
        xml.author "Don VanDemark and Randy Burgess"
        xml.id article.data.id
        xml.published article.date.to_time.iso8601
        xml.pubDate article.date.to_time.iso8601
        xml.updated article.date.to_time.iso8601
        xml.itunes :duration, text: "15:15"
        xml.description do
          xml.cdata! article.body
        end
        xml.enclosure url: "https://testing.com/#{article.data.audio_file_name}", length: "37934213", type: "audio/mp3"
        xml.link "https://testing.com/#{article.data.audio_file_name}"
      end
    end
  end
end

# <itunes:type>episodic</itunes:type>
# <itunes:subtitle>
# Ben Orenstein and Derrick Reimer on the intersection of code and business
# </itunes:subtitle>
# <itunes:author>Ben Orenstein and Derrick Reimer</itunes:author>
# <enclosure url="https://aphid.fireside.fm/d/1437767933/6fccc249-743a-4298-a664-d8d863346db9/12344cfb-fef6-4c97-a642-92ebe2acbc88.mp3" length="37934213" type="audio/mp3"/>
# <guid isPermaLink="false">12344cfb-fef6-4c97-a642-92ebe2acbc88</guid>
