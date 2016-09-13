class NewsStand::Scraper

  def self.scrape_categories
    doc = Nokogiri::HTML(open("http://www.cnn.com/us"))
    attributes = doc.css("div#nav-section-submenu[data-analytics-header='main-menu_us'] a.nav-section__submenu-item")

    attributes.each do |a|
      category = NewsStand::Category.new
      category.name = a.text
      category.url = "http://www.cnn.com" + a.attribute("href").value
      NewsStand::Category.all << category
    end
  end

  def self.scrape_crime_justice
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/crime-and-justice"))
    @title = doc.css("h3.cd__headline a span.cd__headline-text")
    @link = doc.css("h3.cd__headline a")
    @crime_category = NewsStand::Category.all.find {|c| c.name.downcase.include?("crime")}

    @counter = 0
    @link[0..29].each do |l|
      if l.attribute("href").value.include?("http://")
        @url = l.attribute("href").value
      else
        @url = ("http://www.cnn.com" + l.attribute("href").value)
      end
      @page = Nokogiri::HTML(open("#{@url}"))
      @content = @page.css("div.l-container .zn-body__paragraph").text

      if @content != nil || @content != ""
        @article = NewsStand::Article.new
        @article.url = @url
        @article.content = @content
        @article.title = @title["#{@counter}".to_i].text
        @crime_category.add_article(@article) unless @crime_category.articles.size >= 10
        @counter += 1
      end
    end
    @counter
  end

  def self.scrape_energy_environment
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/energy-and-environment"))
    @title = doc.css("h3.cd__headline a span.cd__headline-text")
    @link = doc.css("h3.cd__headline a")
    @energy_category = NewsStand::Category.all.find {|c| c.name.downcase.include?("energy")}

    @counter = 0
    @link[0..29].each do |l|
      if l.attribute("href").value.include?("http://")
        @url = l.attribute("href").value
      else
        @url = ("http://www.cnn.com" + l.attribute("href").value)
      end
      @page = Nokogiri::HTML(open("#{@url}"))
      @content = @page.css("div.l-container .zn-body__paragraph").text

      unless @content == nil || @content == ""
        @article = NewsStand::Article.new
        @article.url = @url
        @article.content = @content
        @article.title = @title["#{@counter}".to_i].text
        @energy_category.add_article(@article) unless @energy_category.articles.size >= 10
      end
      @counter += 1
    end
    @counter
  end

  def self.scrape_extreme_weather
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/extreme-weather"))
    @title = doc.css("h3.cd__headline a span.cd__headline-text")
    @link = doc.css("h3.cd__headline a")
    @weather_category = NewsStand::Category.all.find {|c| c.name.downcase.include?("weather")}

    @counter = 0
    @link[0..29].each do |l|
      if l.attribute("href").value.include?("http://")
        @url = l.attribute("href").value
      else
        @url = ("http://www.cnn.com" + l.attribute("href").value)
      end
      @page = Nokogiri::HTML(open("#{@url}"))
      @content = @page.css("div.l-container .zn-body__paragraph").text

      if @content != nil || @content != ""
        @article = NewsStand::Article.new
        @article.url = @url
        @article.content = @content
        @article.title = @title["#{@counter}".to_i].text
        @weather_category.add_article(@article) unless @weather_category.articles.size >= 10
        @counter += 1
      end
    end
    @counter
  end

  def self.scrape_space_science
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/space-science"))
    @title = doc.css("h3.cd__headline a span.cd__headline-text")
    @link = doc.css("div.cd__content h3 a")
    @space_category = NewsStand::Category.all.find {|c| c.name.downcase.include?("space")}

    @counter = 0
    @link[0..29].each do |l|
      if l.attribute("href").value.include?("http://")
        @url = l.attribute("href").value
      else
        @url = ("http://www.cnn.com" + l.attribute("href").value)
      end
      @page = Nokogiri::HTML(open("#{@url}"))
      @content = @page.css("div.l-container .zn-body__paragraph").text

      if @content != nil || @content != ""
        @article = NewsStand::Article.new
        @article.url = @url
        @article.content = @content
        @article.title = @title["#{@counter}".to_i].text
        @space_category.add_article(@article) unless @space_category.articles.size >= 10
        @counter += 1
      end
    end
    @counter
  end
end
