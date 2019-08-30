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
    restaurants = TenRestaurantsFour::Restaurants
    # binding.pry
    list_restaurant(restaurants)
  end

  def list_restaurant(restaurants)
    puts ""
    puts "NAME:         #{restaurants[0]}"
    puts "LOCATION:     #{restaurants[2]}"
    puts "CUISINE:      #{restaurants[3]}"
  end
end
