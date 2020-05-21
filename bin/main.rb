#!/usr/bin/env ruby
require 'nokogiri'
require 'byebug'
require 'watir'
require 'csv'
require 'ruby-progressbar'
require 'open-uri'
require_relative '../lib/methods.rb'
require_relative '../lib/book_data.rb'
require_relative '../lib/goodreads_scraper.rb'
require_relative '../lib/ratings.rb'

SCRAPPED_NYT_PAGE = scrap_nytimes

books_csv = create_csv
all_books = []
i = 0
j = 0
# progressbar = ProgressBar.create(format: '%a <%B> %p%% %t')

sections.each do |section|
  5.times do
    book = BookData.new(i, section).book_data_array
    i += 1
    all_books << book
    until j == all_books.count
      good_reads = GReadsScraper.new(j, all_books)
      rating = Ratings.new(good_reads.html)
      begin
        sleep 2
        book.insert(4, rating.avg_rating)
        book.insert(5, rating.num_of_ratings)
        good_reads.close_browser
        j += 1
        p j
        # progressbar.increment
      rescue StandardError
        retry
      end
    end
    books_csv << book
  end
end
