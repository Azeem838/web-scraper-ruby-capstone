require 'nokogiri'
require 'open-uri'
require 'selenium-webdriver'
require_relative '../lib/nyt_scraper.rb'
require_relative '../lib/book_data.rb'
require_relative '../lib/gr_scraper.rb'
require_relative '../lib/ratings.rb'

describe '.BookData' do
  NYTPAGE_CONST = ScrapNYT.new.scrap_sections
  it '#book_data_array is returned containing book data' do
    expect(BookData.new(0, NYTPAGE_CONST[0]).book_data_array).to eq(['Combined Print & E-Book Fiction', 'CAMINO WINDS', 'by John Grisham', 3, 'The line between fact and fiction becomes blurred when an author of thrillers is found dead after a hurricane hits Camino Island.', 'https://www.amazon.com/dp/0385545932?tag=NYTBSREV-20&tag=NYTBS-20'])
  end
end
