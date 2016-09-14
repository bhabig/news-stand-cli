class NewsStand::Article
  attr_accessor :title, :content, :category, :url

  @@all = []

  def initialize(attributes={})
    @title = attributes[:title]
    @url = attributes[:url]
    @content = attributes[:content]
  end

  def self.all
    @@all
  end

end
