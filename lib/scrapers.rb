class GReadsScraper
  def initialize(title_index, all_books, driver)
    @title_index = title_index
    @all_books = all_books
    @driver = driver
  end

  def start_browser
    # options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    @driver = Selenium::WebDriver.for :chrome
    # @driver = Watir::driver.new(:chrome)#, switches: %w[--no-sandbox --headless]
    @driver.get('https://goodreads.com')
  end

  def html
    Nokogiri::HTML.parse(scrap_goodreads.page_source)
  end

  def reset_browser
    @driver.navigate.back
    @driver.find_element(id: 'sitesearch_field').clear
  end

  private

  def scrap_goodreads
    @driver.find_element(id: 'sitesearch_field').send_keys @all_books[@title_index][1], :return
    @driver
  end
end

class ScrapNYT
  def scrap_nytimes
    Nokogiri::HTML(open('https://www.nytimes.com/books/best-sellers/'))
  end

  def scrap_sections
    scrap_nytimes.css('section.e8j42380')
  end
end
