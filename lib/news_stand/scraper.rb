class NewsStand::Scraper

  def self.scrape_categories
    doc = Nokogiri::HTML(open("http://www.cnn.com/us"))
    attributes = doc.css("div#nav-section-submenu[data-analytics-header='main-menu_us'] a.nav-section__submenu-item")

    attributes.each do |a|
      @category = NewsStand::Category.new
      @category.name = a.text
      @category.url = "http://www.cnn.com" + a.attribute("href").value
      NewsStand::Category.all << @category
    end
    NewsStand::Category.all
  end

  def self.scrape_crime_justice
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/crime-and-justice"))
    title = doc.css("h3.cd__headline a span.cd__headline-text")
    link = doc.css("h3.cd__headline a")

    title.each do |t|
      @article = NewsStand::Article.new
      @article.title = t.text

      NewsStand::Category.all.each do |c|
        if c.name.downcase.include?("crime")
          c.add_article(@article) unless c.articles.size >= 5
        end
      end

      @article.url = "http://www.cnn.com" + link.attribute("href").value
    end

    NewsStand::Article.all.each do |a|
      @story = Nokogiri::HTML(open("#{a.url}"))
      a.content = @story.css("div.l-container .zn-body__paragraph").text
    end
  end

  def self.scrape_energy_environment
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/energy-and-environment"))
    title = doc.css("h3.cd__headline a span.cd__headline-text")
    link = doc.css("h3.cd__headline a")

    title.each do |t|
      @article = NewsStand::Article.new
      @article.title = t.text

      NewsStand::Category.all.each do |c|
        if c.name.downcase.include?("energy")
          c.add_article(@article) unless c.articles.size >= 5
        end
      end

      @article.url = "http://www.cnn.com" + link.attribute("href").value
    end

    NewsStand::Article.all.each do |a|
      @story = Nokogiri::HTML(open("#{a.url}"))
      a.content = @story.css("div.l-container .zn-body__paragraph").text
    end
  end

  def self.scrape_extreme_weather
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/us/extreme-weather"))
    title = doc.css("h3.cd__headline a span.cd__headline-text")
    link = doc.css("h3.cd__headline a")

    title.each do |t|
      @article = NewsStand::Article.new
      @article.title = t.text

      NewsStand::Category.all.each do |c|
        if c.name.downcase.include?("extreme")
          c.add_article(@article) unless c.articles.size >= 5
        end
      end

      @article.url = "http://www.cnn.com" + link.attribute("href").value
    end

    NewsStand::Article.all.each do |a|
      @story = Nokogiri::HTML(open("#{a.url}"))
      a.content = @story.css("div.l-container .zn-body__paragraph").text
    end
  end

  def self.scrape_space_science
    doc = Nokogiri::HTML(open("http://www.cnn.com/specials/space-science"))
    title = doc.css("h3.cd__headline a span.cd__headline-text")
    link = doc.css("h3.cd__headline a")

    title.each do |t|
      @article = NewsStand::Article.new
      @article.title = t.text

      NewsStand::Category.all.each do |c|
        if c.name.downcase.include?("space")
          c.add_article(@article) unless c.articles.size >= 5
        end
      end

      @article.url = "http://www.cnn.com" + link.attribute("href").value
    end

    NewsStand::Article.all.each do |a|
      @story = Nokogiri::HTML(open("#{a.url}"))
      a.content = @story.css("div.l-container .zn-body__paragraph").text
    end
  end
end
