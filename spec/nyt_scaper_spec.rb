require 'nokogiri'
require 'open-uri'
require 'selenium-webdriver'
require_relative '../lib/nyt_scraper.rb'
require_relative '../lib/book_data.rb'
require_relative '../lib/gr_scraper.rb'
require_relative '../lib/ratings.rb'

describe '.nyt_scraper' do
  let(:test_nyt_scraper) { ScrapNYT.new }

  context '#scrap_nytimes testing' do
    it 'needs to respond to #css' do
      expect(test_nyt_scraper.scrap_nytimes).respond_to? :css
    end
  end

  context '#scrap_nytimes testing for ' do
    it 'needs to be of Nokogiri::HTML::Document>' do
      expect(test_nyt_scraper.scrap_nytimes).to be_a(Nokogiri::HTML::Document)
    end
  end

  context '#scrap_sections testing' do
    it 'needs to respond to #each' do
      expect(test_nyt_scraper.scrap_sections).respond_to? :each
    end
  end
end
