def create_csv
  new_csv = CSV.open('Book_Recommendations.csv', 'a+')
  new_csv << %w[Section Title Author Time(Weeks) avg_rating num_of_ratings Description Link]
end

def sections
  SCRAPPED_NYT_PAGE.css('section.e8j42380')
end

def scrap_nytimes
  Nokogiri::HTML(open('https://www.nytimes.com/books/best-sellers/')) 
end
