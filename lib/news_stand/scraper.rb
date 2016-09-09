class NewsStand::Scraper

  def self.scrape_crime_justice
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/crime-and-justice"))
    #title = doc.css("h3.cd__headline a span.cd__headline-text").each{|x| puts x.text}

    #@links = []
    #link: doc.css("h3.cd__headline a").each do |x|
    #   @links << "http://www.cnn.com"+x.attribute("href").value
    #end

    #@articles = []
    #content: @links.each do |l|
    # => @article = Nokogiri::HTML(open("#{l}"))
    # => @articles << @article.css("div.l-container .zn-body__paragraph").text ** careful of creating objects without content (some are video)
    #end
  end

  def self.scrape_energy_environment
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/energy-and-environment"))
    #title = doc.css("h3.cd__headline a span.cd__headline-text").each{|x| puts x.text}

    #@links = []
    #link: doc.css("h3.cd__headline a").each do |x|
    #   @links << "http://www.cnn.com"+x.attribute("href").value
    #end

    #@articles = []
    #content: @links.each do |l|
    # => @article = Nokogiri::HTML(open("#{l}"))
    # => @articles << @article.css("div.l-container .zn-body__paragraph").text ** careful of creating objects without content (some are video)
    #end

  end

  def self.scrape_extreme_weather
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/extreme-weather"))
    #title = doc.css("h3.cd__headline a span.cd__headline-text").each{|x| puts x.text}

    #@links = []
    #link: doc.css("h3.cd__headline a").each do |x|
    #   @links << "http://www.cnn.com"+x.attribute("href").value
    #end

    #@articles = []
    #content: @links.each do |l|
    # => @article = Nokogiri::HTML(open("#{l}"))
    # => @articles << @article.css("div.l-container .zn-body__paragraph").text ** careful of creating objects without content (some are video)
    #end
  end

  def self.scrape_space_science
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/space-science"))
    #title = doc.css("h3.cd__headline a span.cd__headline-text").each{|x| puts x.text}

    #link: doc.css("h3.cd__headline a").each do |x|
    #   @link = "http://www.cnn.com"+x.attribute("href").value
    #   @article = Nokogiri::HTML(open("#{@link}"))
    #end

    #content: @article.css("div.l-container .zn-body__paragraph").text ** careful of creating objects without content (some are video)
  end

  def self.scrape_categories
    doc = Nokogiri::HTML(open("http://www.cnn.com/us"))

    #category titles = doc.css("div#nav-section-submenu[data-analytics-header='main-menu_us'] a.nav-section__submenu-item").each {|x| puts x.text}
    #category links = @links = []
    #doc.css("div#nav-section-submenu[data-analytics-header='main-menu_us'] a.nav-section__submenu-item").each do |x|
    # => @links << "http://www.cnn.com" + x.attribute("href").value
    #end
    binding.pry
  end
end
