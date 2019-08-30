require 'pry'

class TenRestaurantsFour::Restaurants

  attr_accessor :name, :cuisine, :location

  @@all = []

  def self.new_from_index_page(r)
    # binding.pry
    self.new(
      r.css("a.restaurant-card__anchor").attribute("aria-label").value,
      r.css("span.restaurant-card__media-text").text.gsub(/\s+/, "").split(",").first(1).join(" "),
      r.css("a.restaurant-card__media span.restaurant-card__media-text").text
    )
  end

  def initialize(name, cuisine, location)
    @name = name
    @cuisine = cuisine
    @location = location
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

end
