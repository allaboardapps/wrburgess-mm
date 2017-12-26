xml.feed "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd", "version" => "2.0", "xmlns:atom"=> "http://www.w3.org/2005/Atom" do
  xml.title "CTO Think"
  xml.description "The podcast description"
  xml.link "href" => "https://www.ctothink.com/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "Randy Burgess" }
  xml.language "en-us"

  blog.articles.each do |article|
    xml.entry do
      xml.title article.title
      xml.id article.data.id
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
    end
  end
end
