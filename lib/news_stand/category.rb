class NewsStand::Category
  attr_accessor :name, :articles, :url

  def self.categories
    puts "Welcome To Your Personal News Stand - Where Every Story From All The Top Sources Is Yours To Read... All In One Place!"
    puts <<-DOC.gsub(/^\s*/,'')
      1. World
      2. US
      3. Science
      4. Tech
      5. Odd
    DOC

    national = self.new
    national.name = "US"
    national.url = "https://www.yahoo.com/news/us/"

    world = self.new
    world.name = "World"
    world.url = "https://www.yahoo.com/news/world/"

    science = self.new
    science.name = "Science"
    science.url = "https://www.yahoo.com/news/science/"

    tech = self.new
    tech.name = "Tech"
    tech.url = "https://www.yahoo.com/tech"

    odd = self.new
    odd.name = "Odd News"
    odd.url = "https://www.yahoo.com/news/odd/"

    politics = self.new
    politics.name = "Politics"
    politics.url = "https://www.yahoo.com/news/politics"

    [odd, politics, national, world, tech, science]
  end
end
