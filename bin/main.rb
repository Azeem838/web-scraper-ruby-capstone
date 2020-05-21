#!/usr/bin/env ruby
require 'nokogiri'
require 'byebug'
require 'csv'
require 'ruby-progressbar'
require 'open-uri'
require 'selenium-webdriver'
require_relative '../lib/nyt_scraper.rb'
require_relative '../lib/book_data.rb'
require_relative '../lib/gr_scraper.rb'
require_relative '../lib/ratings.rb'

NYTPAGE_CONST = ScrapNYT.new.scrap_sections

new_csv = CSV.open('csv_output/Book_Recommendations.csv', 'a+')
new_csv << %w[Section Title Author Time(Weeks) Avg_Rating Num_of_Ratings Description Link]

books_csv = new_csv
all_books = []
i = 0
j = 0

progressbar = ProgressBar.create(title: 'Books', total: 55, length: 80, format: '%a <%B> %p%% %t')

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(timeout: 10)
driver.get('https://goodreads.com')

NYTPAGE_CONST.each do |section|
  5.times do
    book = BookData.new(i, section).book_data_array
    i += 1
    all_books << book
    until j == all_books.count
      good_reads = GReadsScraper.new(j, all_books, driver)
      rating = Ratings.new(good_reads.html)
      avg_rating = wait.until { rating.avg_rating }
      num_of_ratings = wait.until { rating.num_of_ratings }
      book.insert(4, avg_rating)
      book.insert(5, num_of_ratings)
      good_reads.reset_browser
      j += 1
      progressbar.increment
    end
    books_csv << book
  end
end
