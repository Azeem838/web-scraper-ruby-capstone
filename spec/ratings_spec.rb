require 'nokogiri'
require 'open-uri'
require 'selenium-webdriver'
require_relative '../lib/book_data.rb'
require_relative '../lib/gr_scraper.rb'
require_relative '../lib/ratings.rb'

describe '.ratings' do
  let(:test_ratigns) { Ratings.new(gr_web_page) }

  context '#avg_rating' do
    let(:gr_web_page) { Nokogiri::HTML(open('https://www.goodreads.com/search?utf8=%E2%9C%93&query=CAMINO+WINDS')) }
    it 'returns the average rating' do
      expect(gr_web_page.at_css('span.minirating').text.split[0].to_f).to be_a(Float)
    end
  end
  context '#num_of_ratings' do
    let(:gr_web_page) { Nokogiri::HTML(open('https://www.goodreads.com/search?utf8=%E2%9C%93&query=CAMINO+WINDS')) }
    it 'returns the number of ratings' do
      expect(gr_web_page.at_css('span.minirating').text.split[4].gsub(/,/, '').to_i).to be_a(Integer)
    end
  end
end
