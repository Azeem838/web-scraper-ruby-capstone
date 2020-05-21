class Ratings
  def initialize(browser)
    @browser = browser
  end

  def html
    Nokogiri::HTML.parse(@browser.html)
  end

  def avg_rating
    html.at_css('span.minirating').text.split[0].to_f
  end

  def num_of_ratings
    html.at_css('span.minirating').text.split[4].gsub(/,/, '').to_i
  end
end
