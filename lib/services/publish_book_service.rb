class PublishBookService
    attr_reader :errors

    def initialize(published_book, authors)
        @errors = nil
        @book_params = published_book
        @authors = []

        authors.each do |author|
            if author.is_a?(Author)
                @authors << author
                next
            end

            author_in_db = Author.find_by(author)
            author_in_db = Author.new(author) if author_in_db.nil?
            @authors << author_in_db
        end
    end

    def valid?
        Book.new(@book_params).valid? and @authors.all?(&:valid?)
    end

    def execute
        book = Book.new(@book_params)

        @authors.each do |author|
            author.save unless author.persisted?
        end

        book.authors = @authors
        saved = book.save
        @errors = book.errors
        saved
    end

end
