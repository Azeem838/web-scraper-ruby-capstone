class GReadsScraper
  def initialize(title_index, all_books)
    @title_index = title_index
    @all_books = all_books
    @browser = Watir::Browser.new(:chrome) # , switches: %w[--ignore-certificate-errors --disable-popup-blocking --no-sandbox --disable-translate --disable-notifications --start-maximized --disable-gpu --headless]
    @browser.goto('goodreads.com')
  end

  def html
    Nokogiri::HTML.parse(scrap_goodreads.html)
  end

  def close_browser
    @browser.close
  end

  def scrap_goodreads
    @browser.text_field(id: 'sitesearch_field').set @all_books[@title_index][1]
    @browser.send_keys :enter
    @browser
  end
end
