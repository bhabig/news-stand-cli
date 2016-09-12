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
    @link.each do |l|
      @url = ("http://www.cnn.com" + l.attribute("href").value)
      @page = Nokogiri::HTML(open("#{@url}"))
      @content = page.css("div.l-container .zn-body__paragraph").text

      if @content != nil || @ontent != ""
        @article = NewsStand::Article.new
        @article.url = @url
        @article.content = @content
        @article.title = @title["#{@counter}"].text
        @crime_category.add_article(@article) unless @crime_category.articles.size >= 10
        @counter += 1
      end
    end
    @counter
  end

  def self.scrape_energy_environment
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/energy-and-environment"))
    title = doc.css("h3.cd__headline a span.cd__headline-text")
    link = doc.css("h3.cd__headline a")
    @energy_category = NewsStand::Category.all.find {|c| c.name.downcase.include?("energy")}

    title.each do |t|
      @article = NewsStand::Article.new
      @article.title = t.text

      if @energy_category.articles.size < 10
        @energy_category.add_article(@article) unless @energy_category.articles.include?(@article)
      end
    end

    @counter = 0
    @energy_category.articles.each do |a|
      a.url = ("http://www.cnn.com" + link["#{@counter}".to_i].attribute("href").value)
      page = Nokogiri::HTML(open("#{a.url}"))

      a.content = page.css("div.l-container .zn-body__paragraph").text

      @counter += 1
    end
    @counter
    @energy_category.articles.delete_if{|a| a.content == "" || a.content == nil}
  end

  def self.scrape_extreme_weather
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/extreme-weather"))
    title = doc.css("h3.cd__headline a span.cd__headline-text")
    link = doc.css("h3.cd__headline a")
    @weather_category = NewsStand::Category.all.find {|c| c.name.downcase.include?("weather")}

    title.each do |t|
      @article = NewsStand::Article.new
      @article.title = t.text

      if @weather_category.articles.size < 10
        @weather_category.add_article(@article) unless @weather_category.articles.include?(@article)
      end
    end

    @counter = 0
    @weather_category.articles.each do |a|
      a.url = ("http://www.cnn.com" + link["#{@counter}".to_i].attribute("href").value)
      page = Nokogiri::HTML(open("#{a.url}"))

      a.content = page.css("div.l-container .zn-body__paragraph").text

      @counter += 1
    end
    @counter
    @weather_category.articles.delete_if{|a| a.content == "" || a.content == nil}
  end

  def self.scrape_space_science
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/space-science"))
    title = doc.css("h3.cd__headline a span.cd__headline-text")
    link = doc.css("h3.cd__headline a")
    @space_category = NewsStand::Category.all.find {|c| c.name.downcase.include?("space")}

    title.each do |t|
      @article = NewsStand::Article.new
      @article.title = t.text

      if @space_category.articles.size < 10
        @space_category.add_article(@article) unless @space_category.articles.include?(@article)
      end
    end

    @counter = 0
    @space_category.articles.each do |a|
      a.url = ("http://www.cnn.com" + link["#{@counter}".to_i].attribute("href").value)
      page = Nokogiri::HTML(open("#{a.url}"))

      a.content = page.css("div.l-container .zn-body__paragraph").text

      @counter += 1
    end
    @counter
    @space_category.articles.delete_if{|a| a.content == "" || a.content == nil}
  end
end
