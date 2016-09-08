class NewsStand::Article
  attr_accessor :title, :content, :category, :url

  @@all = []

  def self.articles(category)
    article_1 = self.new
    article_1.title = "premier league outbreak"
    article_1.category = "sports"

    article_2 = self.new
    article_2.title = "frenchies smell"
    article_2.category = "world"

    article_3 = self.new
    article_3.title = "Kanye still beloved gay fish"
    article_3.category = "odd"

    article_4 = self.new
    article_4.title = "Why aren\'t british cars engineered better?"
    article_4.category = "science"

    article_5 = self.new
    article_5.title = "Hilary MRI Shows No Soul"
    article_5.category = "tech"

    @@all = [article_1, article_2, article_3, article_4, article_5]

    @@all.each.with_index(1) do |article, index|
      if article.category == category.downcase
        puts "#{index}. #{article.title}"
      end
    end
  end



end
