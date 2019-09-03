require "pry"
require 'tty-prompt'
require "tty-font"
require 'pastel'
require 'colorize'
require 'gemoji'

class TwentyRestaurantsFour::CLI

  def initialize
    @prompt = TTY::Prompt.new
    @font = TTY::Font.new(:doom)
  end

  def call
    TwentyRestaurantsFour::Scraper.get_new_page

    puts ""
    pastel = Pastel.new
    puts pastel.blue.on_red.bold(@font.write("20 Restaurants 4"))
    puts "\n" "\u{1f373}" "\u{1F958}" " Hello, Welcome to 20 Restaurants 4  " "\u{1F958}" "\u{1f373}".colorize(:color => :red, :background => :blue)
    sleep(3)
    get_user_name
  end

  def get_user_name
    name = @prompt.ask('What is your name?')
    puts "Helloooo #{name}!!!!".colorize(:color => :yellow, :background => :purple)
    begins
  end

  def begins
    #list out all restaurants
    puts ""
    puts "Here is a list of the top 20 Restaurants 4 Something Special" "\n"
    sleep(2)
    restaurants = TwentyRestaurantsFour::Restaurants.all
    twenty_res = restaurants.slice(0..19)
    # binding.pry
    print_res(twenty_res)
  end

  def print_res(twenty_res)
    puts "\u{1F32F}" "\u{1F950}" "Choose a restaurant number 1-20.   " "\u{1F950}" "\u{1F32F}".colorize(:color => :red, :background => :blue)
    sleep(2)
    twenty_res.each_with_index do |r, i|
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
    restaurant = TwentyRestaurantsFour::Restaurants.find(choice.to_i)

    puts "You've chosen #{restaurant.name}! Great, let's just get that information for you......".colorize(:color => :red, :background => :blue)
    puts "\n"
    puts "----------------------------------------------------"
    sleep(4)
    puts "#{restaurant.details}"
    choice_1 = @prompt.yes?("Great! Would you like to view another restaurant?")
      if choice_1 == true
        print_res(twenty_res)
    # binding.pry
      else
        puts "\n"
        puts "----------------------------------------------------"
        puts "\n"
        puts "Thanks for using Twenty Restaurants Four!".colorize(:color => :red, :background => :blue)
        puts "\n"
        puts "----------------------------------------------------"
        puts "\n"
      end
      # binding.pry
    end
  end
