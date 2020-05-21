class ScrapNYT
  def scrap_nytimes
    Nokogiri::HTML(open('https://www.nytimes.com/books/best-sellers/'))
  end

  def scrap_sections
    scrap_nytimes.css('section.e8j42380')
  end
end
