class TenRestaurantsFour::Restaurants

  attr_accessor :name, :cuisine, :location

  @@all = ()

  def self.new_from_index_page(r)
    self.new(
      r.css("a.restaurant-card__anchor").attribute("aria-label").value,
      r.css("span.restaurant-card__media-text").text.gsub(/\s+/, "").split(",").first(2),
      r.css("span.restaurant-card__media-text").text.gsub(/\s+/, "").split(",")[3].delete!('£'))
  end

  def initialize(name=nil, cuisine=nil, location=nil)
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
