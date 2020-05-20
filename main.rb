require 'nokogiri'
require 'httparty'
require 'byebug'
require 'csv'

def scraper
  books_csv = CSV.open('Book_Recommendations.csv', 'a+')
  books_csv << %w[Section Title Author Time Description]
  url = 'https://www.nytimes.com/books/best-sellers/'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  books = []
  sections = parsed_page.css('section.e8j42380')
  books_shown = parsed_page.css('a.css-g5yn3w') # 55 books
  i = 0
  sections.each do |section|
    section_name = section.css('a.css-nzgijy').text
    5.times do
      book = [
        section_name = section.css('a.css-nzgijy').text,
        books_shown[i].css('h3.css-i1z3c1').text,
        books_shown[i].css('p.css-1nxjbfc').text,
        books_shown[i].css('p.css-t7cods').text.gsub(/\D/, '').to_i,
        books_shown[i].css('p.css-5yxv3r').text
      ]
      i += 1
      books << book
      books_csv << book
    end
  end
end
scraper
