require 'nokogiri'
require 'open-uri'
require 'pry'

require 'twenty_restaurants_four'

class TwentyRestaurantsFour::Scraper

  def self.get_page
    page = Nokogiri::HTML(open("https://www.discoeat.co.uk/london/"))
    doc = page.css("div.d-flex ul#restaurantsList li.card-grid__item")
    self.make_restaurants(doc)
  end

  def self.make_restaurants(doc)
    doc.each do |r|
      # binding.pry
      TwentyRestaurantsFour::Restaurants.new_from_index_page(r)
    end
  end

  def self.get_new_page
    self.get_page
    # page_num = 2
    page_array = [2, 3, 4, 5]
    page_array.each do |page_num|
    # until page_num == 5 do
      page = Nokogiri::HTML(open("https://www.discoeat.co.uk/london/?page=#{page_num}"))
      doc = page.css("div.d-flex ul#restaurantsList li.card-grid__item")
      doc.each do |r|
        TwentyRestaurantsFour::Restaurants.new_from_index_page(r)
      end
    end
    # page_num += 1
    # binding.pry

  end

  def res_details(url)
    res = Nokogiri::HTML(open(url))
    res_info = res.css("article.article section#information p.text-justify").text
    # TwentyRestaurantsFour::Restaurants.new.details(res_info)
    puts res_info
  end
end
