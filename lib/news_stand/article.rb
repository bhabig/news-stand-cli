class NewsStand::Article
  attr_accessor :title, :content, :category, :url

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def category_name
    self.category ? self.category.name : nil
  end





end
