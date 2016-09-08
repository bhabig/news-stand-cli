class NewsStand::Category
  attr_accessor :name, :articles, :url

  @@all = []

  def initialize(category_array)

    @@all << self
  end

  def self.all
    @@all
  end
end
