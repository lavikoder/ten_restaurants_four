require 'nokogiri'
require 'open-uri'
require 'pry'

require 'ten_restaurants_four'

class TenRestaurantsFour::Scraper

  def self.get_page
    page = Nokogiri::HTML(open("https://www.discoeat.co.uk/london/"))
    doc = page.css("div.d-flex ul#restaurantsList li.card-grid__item")
    self.make_restaurants(doc)
  end

  def self.make_restaurants(doc)
      doc.each do |r|
      # binding.pry
      TenRestaurantsFour::Restaurants.new_from_index_page(r)
    end
  end

  def res_details(url)
    res = Nokogiri::HTML(open(url))
    res_info = res.css("article.article section#information p.text-justify").text
    # TenRestaurantsFour::Restaurants.new.details(res_info)
    puts res_info
  end

end


# Scraper.new.make_restaurants
