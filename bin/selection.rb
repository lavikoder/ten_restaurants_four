#!/usr/bin/env ruby

require "bundler/setup"
require_relative '../lib/ten_restaurants_four'

# TenRestaurantsFour::Scraper.make_restaurants
TenRestaurantsFour::CLI.new.call
