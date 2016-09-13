#CLI Controller
class NewsStand::CLI

  def call
    list_categories
    list_articles
    goodbye
  end

  def scrape
    NewsStand::Scraper.scrape_categories
    NewsStand::Scraper.scrape_crime_justice
    NewsStand::Scraper.scrape_energy_environment
    NewsStand::Scraper.scrape_extreme_weather
    NewsStand::Scraper.scrape_space_science
  end

  def list_categories
    NewsStand::Category.all_categories
  end

  def list_articles
    unless @input != nil
      puts "enter the number for the category from which you'd like to read articles or enter 'exit'"
      print ":"
    end
    @input ||= gets.strip
    if @input == "1"
      @category = NewsStand::Category.all.find {|c| c.name.downcase.include?("crime")}

      @category.category_articles
      read_article
    elsif @input == "2"
      @category = NewsStand::Category.all.find {|c| c.name.downcase.include?("energy")}

      @category.category_articles
      read_article
    elsif @input == "3"
      @category = NewsStand::Category.all.find {|c| c.name.downcase.include?("extreme")}

      @category.category_articles
      read_article
    elsif @input == "4"
      @category = NewsStand::Category.all.find {|c| c.name.downcase.include?("space")}

      @category.category_articles
      read_article
    elsif @input == "back"
      @input = nil
      call
    elsif @input == "exit"
      goodbye
      exit
    else
      puts "did not recognize your request."
      @input = nil
      list_articles
    end
  end

  def read_article
    puts "enter the number for the article you want to read. to choose another category enter 'back' to return to the categories menu, or enter 'exit'"
    print ":"
    input = gets.strip
    if input == "back"
      @input = nil
      call
    elsif input.to_i > 0 && input.to_i <= 5
      puts @category.articles[input.to_i - 1].content
      puts "---------------------------------------------------------------------------------------------------------------------------"
      list_articles
    elsif input == "exit"
      goodbye
      exit
    else
      puts "did not recognize your request."
      read_article
    end
  end

  def goodbye
    puts "See You Tomorrow!"
  end
end
