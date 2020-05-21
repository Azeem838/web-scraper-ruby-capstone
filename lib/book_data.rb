class BookData
  def initialize(book_info_index, section_index)
    @book_info_index = book_info_index
    @section_index = section_index
  end

  def book_data_array
    [section_name, title, author, time, description, link]
  end

  private

  def section_name
    @section_index.css('a.css-nzgijy').text
  end

  def book_info
    SCRAPPED_NYT_PAGE.css('li.css-1mr03gh') # 55 books
  end

  def title
    book_info[@book_info_index].css('h3.css-i1z3c1').text
  end

  def author
    book_info[@book_info_index].css('p.css-1nxjbfc').text
  end

  def time
    book_info[@book_info_index].css('p.css-t7cods').text.gsub(/\D/, '').to_i
  end

  def description
    book_info[@book_info_index].css('p.css-5yxv3r').text
  end

  def link
    book_info[@book_info_index].at_css('a.css-hndxeu').attributes['href'].value
  end
end
