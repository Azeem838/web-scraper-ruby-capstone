#!/usr/bin/env ruby
require 'nokogiri'
require 'httparty'
require 'byebug'
require 'watir'
require 'csv'
require 'ruby-progressbar'
require_relative '../lib/methods.rb'
require_relative '../lib/book_data.rb'
require_relative '../lib/scraper.rb'
require_relative '../lib/ratings.rb'

SCRAPPED_NYT_PAGE = Scraper.new.scrap_nytimes

books_csv = create_csv
all_books = []
i = 0
j = 0
progressbar = ProgressBar.create(format: '%a <%B> %p%% %t')

sections.each do |section|
  5.times do
    book = BookData.new(i, section).book_data_array
    i += 1
    all_books << book
    until j == all_books.count
      browser = Scraper.new.scrap_goodreads(j, all_books)
      rating = Ratings.new(browser)
      begin
        sleep 2
        avg_rating = rating.avg_rating
        num_of_ratings = rating.num_of_ratings
        book.insert(4, avg_rating)
        book.insert(5, num_of_ratings)
        browser.close
        j += 1
        progressbar.increment
      rescue StandardError
        retry
      end
    end
    books_csv << book
  end
end
