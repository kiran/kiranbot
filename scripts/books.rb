require 'csv'
require 'erb'
require 'open-uri'

class Book
  def initialize(row)
    @title = row["Title"]
    @isbn = row["ISBN13"]
    @rating = row["My Rating"].to_i
    @blurb = row["Blurb"]
    @author = row["Author"]
    @tags = row['tags'].nil? ? [] : row['tags'].split(',')
    fetch_image(row["ISBN13"])
  end

  def fetch_image(isbn)
    path = "../static/images/2016-books/#{@isbn}.jpg"

    # short circuit if it exists
    if File.exists?(path)
      puts "skipping #{isbn}"
      return
    end

    File.open(path, 'wb') do |fo|
      path = URI("http://covers.openlibrary.org/b/isbn/#{isbn}-M.jpg")
      fo.write(open(path).read())
    end
    puts "Fetched image for #{@title}"
  end

  def render(renderer)
    renderer.result(binding)
  end
end

def parse_books(input_csv_path)
  books = []
  CSV.foreach(input_csv_path, {headers: :first_row}) do |row|
    books << Book.new(row)
  end
  books
end

def export_template(output_file_path, books)
  renderer = ERB.new(File.read("./book_template.erb"))
  File.open(output_file_path, 'w') do |fo|
    fo.write('<section id="books-list">'+"\n")
    books.each do |book|
      fo.write(book.render(renderer))
    end
    fo.write('</section>')
  end
end

if __FILE__ == $0
  books = parse_books("goodreads library - 2016-books.csv")
  export_template('books_templated', books)
end