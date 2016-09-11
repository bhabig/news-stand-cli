class NewsStand::Category
  attr_accessor :name, :articles, :url

  @@all = []

  def initialize
    @articles = []
  end

  def self.all
    @@all
  end

  def add_article(article)
    article.category = self
    self.articles << article
  end

  def self.all_categories
    puts "Welcome To Your Personal News Stand Where You Can Choose From Yahoo Articles By Category"
    self.all.each.with_index(1) do |category, index|
      puts "#{index}. #{category.name}"
    end
    puts "enter the number for the category from which you'd like to read articles or enter 'exit'"
    print ":"
    @input = gets.strip
    if @input == "exit"
      goodbye
      exit
    end
  end

  def category_articles
    self.articles.each.with_index(1) do |article, index|
        puts "#{index}. #{article.title}"
    end
  end
end
