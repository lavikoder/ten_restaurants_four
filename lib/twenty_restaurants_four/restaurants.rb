require 'pry'
require "nokogiri"

class TwentyRestaurantsFour::Restaurants

  attr_accessor :name, :cuisine, :location, :url, :details

  @@all = []

  def self.new_from_index_page(r)
    # binding.pry
    self.new(
      r.css("a.restaurant-card__anchor").attribute("aria-label").value,
      r.css("span.restaurant-card__media-text").text.gsub(/\s+/, "").split(",").first(1).join(" "),
      r.css("a.restaurant-card__media span.restaurant-card__media-text").text,
      r.css("a.restaurant-card__anchor").attribute("href").value,
    )
  end

  def initialize(name, cuisine, location, url)
    @name = name
    @cuisine = cuisine
    @location = location
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def id
    self.find(id)
  end

  def details
    info = Nokogiri::HTML(open(self.url))
    @details ||= info.css("article.article section#information p.text-justify").text
  end





end
