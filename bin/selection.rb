#!/usr/bin/env ruby

require "bundler/setup"
require_relative '../lib/twenty_restaurants_four'

# TenRestaurantsFour::Scraper.make_restaurants
TwentyRestaurantsFour::CLI.new.call
