require "pry"
require 'tty-prompt'
require "tty-font"
require 'pastel'
require 'colorize'
require 'gemoji'

class TenRestaurantsFour::CLI

  def initialize
    @prompt = TTY::Prompt.new
    @font = TTY::Font.new(:doom)
  end

  def call
    TenRestaurantsFour::Scraper.get_page
    puts ""
    pastel = Pastel.new
    puts pastel.blue.on_red.bold(@font.write("10 Restaurants 4"))
    puts "\n" "\u{1f373}" " Hello, Welcome to 10 Restaurants 4"
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
    print_res(ten_restaurants)
  end

  def print_res(ten_restaurants)
    puts "Choose a restaurant number 1-10."
    sleep(2)
    ten_restaurants.each_with_index do |r, i|
      input = i+1
      puts "---------------------------"
      puts "#{input}"
      puts "NAME:         #{r.name}"
      puts "URL :         #{r.url}"
       if r.location == nil
          puts "LOCATION: London"
        else
          puts "LOCATION:     #{r.location}"
        end
      puts "CUISINE:      #{r.cuisine}"
    end
    choice = gets.chomp
    restaurant = TenRestaurantsFour::Restaurants.find(choice.to_i)
    show_details(restaurant)
  end

    def show_details(restaurant)
      puts "#{restaurant.name}"
      puts "#{restaurant.details}"

      # binding.pry
    end
  end



  #
  # def choose_res(ten_restaurants)
  #   choice = @prompt.select("Choose a restaurant") do |menu|
  #     ten_restaurants.each_with_index do |r, i|
  #       input = i+1
  #       @res = r
  #       menu.choice "#{input}. NAME: #{@res.name},\nLOCATION: #{@res.location}\n\n"
  #     end
  #   end
  #   show_details(choice)
  # end



  # puts "#{input}"
  # restaurantChoice = {
  #   name: "NAME:         #{r.name}",
  #   url: "URL :         #{r.url}",
  #   # if r.location == nil
  #   #   puts "LOCATION: London"
  #   # else
  #     location: "LOCATION:     #{r.location}",
  #     cuisine: "CUISINE:      #{r.cuisine}"
  # }
