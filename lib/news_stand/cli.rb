#CLI Controller
class NewsStand::CLI

  def start
    @categories ||= scrape
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
    NewsStand::Category.all
  end

  def list_categories
    puts "Welcome To Your Personal News Stand Where You Can Choose From Yahoo Articles By Category"
    puts "----------------------------------------------------------------------------------------"
    @categories.each.with_index(1) do |category, index|
      puts "#{index}. #{category.name}"
    end
    puts "----------------------------------------------------------------------------------------"
  end

  def list_articles
    unless @input != nil
      puts "enter the number for the category from which you'd like to read articles or enter 'exit'"
      print ":"
    end
    @input ||= gets.strip
    if @input == "1"
      @category = NewsStand::Category.all.find {|c| c.name.downcase.include?("crime")}
      display_titles
    elsif @input == "2"
      @category = NewsStand::Category.all.find {|c| c.name.downcase.include?("energy")}
      display_titles
    elsif @input == "3"
      @category = NewsStand::Category.all.find {|c| c.name.downcase.include?("extreme")}
      display_titles
    elsif @input == "4"
      @category = NewsStand::Category.all.find {|c| c.name.downcase.include?("space")}
      display_titles
    elsif @input == "back"
      @input = nil
      start
    elsif @input == "exit"
      goodbye
      exit
    else
      puts "did not recognize your request."
      puts "----------------------------------------------------------------------------------------"
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
      puts "----------------------------------------------------------------------------------------"
      start
    elsif input.to_i > 0 && input.to_i <= 5
      display = @category.articles[input.to_i - 1]
      puts "----------------------------------------------------------------------------------------"
      puts "#{display.title}:"
      puts "#{display.content}"
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

  def display_titles
    puts "----------------------------------------------------------------------------------------"
    @category.category_articles
    puts "----------------------------------------------------------------------------------------"
    read_article
  end
end
