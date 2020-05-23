class Ratings
  attr_reader :avg_rating, :num_of_ratings
  def initialize(driver)
    @driver = driver
  end

  def avg_rating
    @driver.find_element(:xpath, '/html/body/div[2]/div[3]/div[1]/div[2]/div[2]/table/tbody/tr[1]/td[2]/div[1]/span/span').text.split[0].to_f
  end

  def num_of_ratings
    @driver.find_element(:xpath, '/html/body/div[2]/div[3]/div[1]/div[2]/div[2]/table/tbody/tr[1]/td[2]/div[1]/span/span').text.split[4].gsub(/,/, '').to_i
  end
end
