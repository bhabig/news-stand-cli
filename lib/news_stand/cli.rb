#CLI Controller
class NewsStand::CLI

  def call
    scrape
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
    puts "enter the number for the category from which you'd like to read articles or enter 'exit'"
    print ":"
    user_input
    until @input == "exit"
      case @input
      when "1"
        NewsStand::Category.all.find {|c| c.name.downcase.include?("crime")}.category_articles
        puts "to choose another category, enter the number or enter 'back' to return to categories. or enter 'exit'"
        print ":"
        user_input
      when "2"
        NewsStand::Category.all.find {|c| c.name.downcase.include?("energy")}.category_articles
        puts "to choose another category, enter the number or enter 'back' to return to categories. or enter 'exit'"
        print ":"
        user_input
      when "3"
        NewsStand::Category.all.find {|c| c.name.downcase.include?("extreme")}.category_articles
        puts "to choose another category, enter the number or enter 'back' to return to categories. or enter 'exit'"
        print ":"
        user_input
      when "4"
        NewsStand::Category.all.find {|c| c.name.downcase.include?("space")}.category_articles
        puts "to choose another category, enter the number or enter 'back' to return to categories. or enter 'exit'"
        print ":"
        user_input
      when "back"
        list_categories
      else
        puts "did not recognize your request. please select a category, enter 'back' to see categories again, or enter 'exit'"
        user_input
      end
    end
  end

  def read_article
    puts "enter the number for the article you'd like to read or enter 'exit'"
    print ":"
    user_input
    until @input == "exit"
      case @input
      when "1"
        puts "here"
      end
    end
  end

  def goodbye
    puts "See You Tomorrow!"
  end

  def user_input
    @input = gets.strip
    if @input == "exit"
      goodbye
      exit
    end
  end
end
