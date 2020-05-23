class GReadsScraper
  attr_reader :reset_browser, :scrap_goodreads
  def initialize(title_index = nil, all_books = nil, driver)
    @title_index = title_index
    @all_books = all_books
    @driver = driver
  end

  def reset_browser
    @driver.navigate.back
    @driver.find_element(id: 'sitesearch_field').clear
  end

  def scrap_goodreads
    @driver.find_element(id: 'sitesearch_field').send_keys @all_books[@title_index][1], :return
    @driver
  end
end
