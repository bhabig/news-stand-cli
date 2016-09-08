class NewsStand::Scraper

  def self.scrape_crime_justice
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/crime-and-justice"))
    #title = doc.css("h3.cd__headline[data-analytics='_list-hierarchical-xs_article_'] a span.cd__headline-text").each{|x| puts x.text}

    #link = doc.css("h3.cd__headline[data-analytics='_list-hierarchical-xs_article_'] a").each{|x| link = http://cnn.com"+x.attribute("href").value
    #@article = Nokogiri::HTML(open("#{link}"))}

    #content = @article.css("div.l-container .zn-body__paragraph").text
  end

  def self.scrape_energy_environment
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/energy-and-environment"))

    #title = doc.css("h3.cd__headline a span.cd__headline-text").each{|x| puts x.text}

=begin
    doc.css("h3.cd__headline a").each do |x|
       link = "http://cnn.com"+x.attribute("href").value
       @article = Nokogiri::HTML(open("#{link}"))
    end
=end

    #content = @article.css("div.l-container .zn-body__paragraph").text

  end

  def self.scrape_world
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/extreme-weather"))

  end

  def self.scrape_health_page
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/space-science"))

  end

  def self.scrape_sports_page
    doc = Nokogiri::HTML(open("http://bleacherreport.com/trending"))

  end
end
