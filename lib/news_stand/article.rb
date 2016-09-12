class NewsStand::Article
  attr_accessor :title, :content, :category, :url

  @@all = []

  def self.all
    @@all
  end

end
