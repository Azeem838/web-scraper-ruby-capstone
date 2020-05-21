def create_csv
  new_csv = CSV.open('csv_output/Book_Recommendations.csv', 'a+')
  new_csv << %w[Section Title Author Time(Weeks) Avg_Rating Num_of_Ratings Description Link]
end
