class Scraper
  def scrap_goodreads(title_index, all_books)
    browser = Watir::Browser.new(:chrome) # , switches: %w[--ignore-certificate-errors --disable-popup-blocking --no-sandbox --disable-translate --disable-notifications --start-maximized --disable-gpu --headless]
    browser.goto('goodreads.com')
    browser.text_field(id: 'sitesearch_field').set all_books[title_index][1]
    browser.send_keys :enter
    browser
  end

  def scrap_nytimes
    url = 'https://www.nytimes.com/books/best-sellers/'
    unparsed_page = HTTParty.get(url)
    Nokogiri::HTML(unparsed_page)
  end
end
