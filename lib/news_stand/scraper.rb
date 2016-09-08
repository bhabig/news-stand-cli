class NewsStand::Scraper

  def self.scrape_entertainment_page
    doc = Nokogiri::HTML(open("http://www.cnn.com/entertainment"))
    #headlines (iterate w/ each to create numbered list and also assign object titles) = doc.css("h3.cd__headline[data-analytics='Top Stories_list-small-vertical_article_'] a span.cd__headline-text")

    #url (iterate w/ each)= doc.css("h3.cd__headline[data-analytics='Top Stories_list-small-vertical_article_'] a") **.each do ** block(puts t.attribute("href").value) ****urls that are generated need the http://www.cnn.com prefix. find a way to add

    #content = doc = Nokogiri::HTML(open("http://www.cnn.com/2016/09/08/entertainment/kanye-west-yeezy-fashion-show/index.html"))
    #doc.css("div.l-container .zn-body__paragraph").text
  end

  def self.scrape_us_page
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/last-50-stories"))
    binding.pry
  end

  def self.scrape_world_page
    doc = Nokogiri::HTML(open("http://www.cnn.com/world"))

  end

  def self.scrape_health_page
    doc = Nokogiri::HTML(open("http://www.cnn.com/health"))

  end

  def self.scrape_sports_page
    doc = Nokogiri::HTML(open("http://bleacherreport.com/trending"))

  end
end
