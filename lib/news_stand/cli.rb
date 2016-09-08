#CLI Controller
class NewsStand::CLI

  def call
    list_categories
    list_articles
    goodbye
  end

  def list_categories
    category = NewsStand::Category.all
    puts "Welcome To Your Personal News Stand - Where Every Story From All The Top Sources Is Yours To Read... All In One Place!"
    category.each.with_index(1) do |category, index|
      puts "#{index}. #{category.name}"
    end
  end

  def list_articles
    @articles = NewsStand::Article
    puts "Select the number for the category from which you'd like to read articles or enter 'exit'"
    print ":"
    user_input
    until @input == "exit"
      case @input
      when "1"
        @articles.articles("World")
        puts "to choose another category, enter the number or enter 'back' to return to categories. or enter 'exit'"
        print ":"
        user_input
      when "2"
        @articles.articles("US")
        puts "to choose another category, enter the number or enter 'back' to return to categories. or enter 'exit'"
        print ":"
        user_input
      when "3"
        @articles.articles("Science")
        puts "to choose another category, enter the number or enter 'back' to return to categories. or enter 'exit'"
        print ":"
        input = gets.strip
        user_input
      when "4"
        @articles.articles("Tech")
        puts "to choose another category, enter the number or enter 'back' to return to categories. or enter 'exit'"
        print ":"
        user_input
      when "5"
        @articles.articles("Odd")
        puts "to choose another category, enter the number or enter 'back' to return to categories. or enter 'exit'"
        print ":"
        user_input
      when "back"
        call
      else
        puts "did not recognize your request. please select a category, enter 'back' to see categories again, or enter 'exit'"
        user_input
      end
    end
  end

  def read_article
    #gets input from list_articles and displays contents
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
