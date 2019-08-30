class TenRestaurantsFour::CLI

  # def initialize
  #   @prompt = TTY::Prompt.new
  #   @font = TTY::Font.new(:doom)
  # end
  # pastel = Pastel.new
  # puts pastel.blue.on_red.bold(@font.write("10 Restaurants 4"))
  # puts "\n" "\u{1f373}" " Hello, Welcome to 10 Restaurants 4"
  require "pry"
  def call
    TenRestaurantsFour::Scraper.get_page
    puts ""
    puts " Hello, Welcome to 10 Restaurants 4"
    sleep(3)
    begins
  end

  def begins
    #list out all restaurants
    puts ""
    puts "Here is a list of the top 10 Restaurants 4 Something Special"
    sleep(2)
    restaurants = TenRestaurantsFour::Restaurants.all
    ten_restaurants = restaurants.slice(0..9)
    # binding.pry
    list_restaurant(ten_restaurants)
  end

  def list_restaurant(ten_restaurants)
    ten_restaurants.each do |r|
      puts "-------------------------------"
      puts ""
      puts "NAME:         #{r.name}"
      if r.location == nil
        puts "LOCATION: London"
      else
        puts "LOCATION:     #{r.location}"
      end
      puts "CUISINE:      #{r.cuisine}"
    end
  end
  def method_name

  end

end
