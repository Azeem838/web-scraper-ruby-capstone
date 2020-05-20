require 'nokogiri'
require 'httparty'
require 'byebug'
require 'watir'
require 'csv'

books_csv = CSV.open('Book_Recommendations.csv', 'a+')
books_csv << %w[Section Title Author Time(Weeks) avg_rating num_of_ratings Description Link]
url = 'https://www.nytimes.com/books/best-sellers/'
unparsed_page = HTTParty.get(url)
parsed_page = Nokogiri::HTML(unparsed_page)
books = []
sections = parsed_page.css('section.e8j42380')
book_wrapper = parsed_page.css('li.css-1mr03gh') # 55 books
i = 0
j = 0
sections.each do |section|
  section_name = section.css('a.css-nzgijy').text
  5.times do
    book = [
      section_name = section.css('a.css-nzgijy').text,
      book_wrapper[i].css('h3.css-i1z3c1').text,
      book_wrapper[i].css('p.css-1nxjbfc').text,
      book_wrapper[i].css('p.css-t7cods').text.gsub(/\D/, '').to_i,
      book_wrapper[i].css('p.css-5yxv3r').text,
      book_wrapper[i].at_css('a.css-hndxeu').attributes['href'].value
    ]
    i += 1
    books << book
    until j == books.count
      browser = Watir::Browser.new(:chrome) # , headless: true
      browser.goto('goodreads.com')
      browser.text_field(id: 'sitesearch_field').set books[j][1]
      browser.send_keys :enter
      begin
        doc = Nokogiri::HTML.parse(browser.html)
        sleep 2
        avg_rating = doc.at_css('span.minirating').text.split[0].to_f
        num_of_ratings = doc.at_css('span.minirating').text.split[4].gsub(/,/, '').to_i
        book.insert(4, avg_rating)
        book.insert(5, num_of_ratings)
        browser.close
        j += 1
      rescue StandardError
        retry
      end
    end
    books_csv << book
  end
end
