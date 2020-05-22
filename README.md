# New York Times Best Sellers Curated with GoodReads.com User Ratings (Capstone Project)

> This project scrapes the New York Times best selling books and finds the corresponding user ratings, combining them into a CSV file.

This project includes the following features:

1. Scrapes [New York Times Best Sellers Static Website](https://www.nytimes.com/books/best-sellers/)
2. Book info is used from step 1 and finds the user ratings and number of ratings from [goodreads](https://www.goodreads.com/)
3. Finally, everything gets displayed categorically in a CSV file

## Built With

- Ruby
- Tested with RSpec
- Gems used: nokogiri, ruby-progressbar and selenium-webdriver

## Getting Started

1. Clone the project to your local machine;
2. cd into the project directory;
3. Run bundle install to install the necessary gems;
4. Installing the ChromeDriver:
   1. Navigate to the [ChromeDriver - WebDriver for Chrome](https://chromedriver.chromium.org/getting-started) webpage;
   2. Read the instruction to setup ChromeDriver on your computer;
   3. Visit the [download page](https://chromedriver.chromium.org/downloads);
   4. Please ensure that you download the version that is compatible with the chrome web browser you have installed on your computer;
   5. Move the chromedriver along your path, e.g Ubuntu Linux you will move it to `usr/local/bin`
5. Run bin/main.rb in your terminal;
6. A new chrome window will open and the magic will begin, just let it do it's job;
7. A progress bar will appear in the terminal, wait for it to reach 100%;
8. Navigate to the project directory and inside the `csv_output` folder;
9. Inside the `csv_output` folder, there will be a file called `Book_Recommendations.csv`
10. Enjoy your curated data!

### NOTE 1: If you get a TCP error when running the program, just wait a few seconds and then run it again

### NOTE 2: If you get a "Unable to find chromedriver" error then you need to revert to step 4 above

## Authors

👤 **Azeem Ahmed**

- Github: [@Azeem838](https://github.com/Azeem838)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Azeem838/web-scraper-ruby-capstone/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.
