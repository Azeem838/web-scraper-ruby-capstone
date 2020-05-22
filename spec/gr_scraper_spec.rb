require 'nokogiri'
require 'open-uri'
require 'selenium-webdriver'
require_relative '../lib/nyt_scraper.rb'
require_relative '../lib/book_data.rb'
require_relative '../lib/gr_scraper.rb'
require_relative '../lib/ratings.rb'

describe '.gr_scraper' do
  let(:test_gr_scraper) { GReadsScraper.new(0, [['CAMINO WINDS']], driver) }
  let(:driver) { Selenium::WebDriver.for :chrome, options: options }
  let(:options) { Selenium::WebDriver::Chrome::Options.new }

  context '#html method testing' do
    it '#html must respond to #at_css' do
      options.add_argument('--headless')
      driver.get('https://goodreads.com')
      expect(test_gr_scraper.html).respond_to? :at_css
    end
  end

  context '#reset_browser testing' do
    it '#reset_browser returns nil if action is complete' do
      options.add_argument('--headless')
      driver.get('https://goodreads.com')
      driver.get('https://www.goodreads.com/search?utf8=%E2%9C%93&query=CAMINO+WINDS')
      expect(test_gr_scraper.reset_browser).to be_nil
    end
  end
end
