class NewsStand::Scraper
  def self.scrape_news_page
    doc = Nokogiri::HTML(open("https://news.google.com/"))
    counter = 1
    doc.css("div.topic-list div.topic").each do |category|
      binding.pry
      puts "#{counter}. #{category.text}"
      counter += 1
    end
    counter
  end

  def self.scrape_science_page
    doc = Nokogiri::HTML(open(@science_page))

  end
anchorman-two-browse-nav
  def self.scrape_us_page
    doc = Nokogiri::HTML(open(@us_page))

  end

  def self.scrape_world_page
    doc = Nokogiri::HTML(open("https://www.yahoo.com/news/world"))

  end

  def self.scrape_tech_page
    doc = Nokogiri::HTML(open("https://www.yahoo.com/tech"))

  end

  def self.scrape_odd_page
    doc = Nokogiri::HTML(open("https://www.yahoo.com/news/odd"))

  end
end
