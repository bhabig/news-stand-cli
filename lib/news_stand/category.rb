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
    NewsStand::Article.all << article
  end

  def category_articles
    self.articles[0..4].each.with_index(1) do |article, index|
      puts "#{index}. #{article.title}"
    end
  end
end
