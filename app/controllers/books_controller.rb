class BooksController < ApplicationController
  before_filter :authenticate_user!

  def index

    if current_user.present?
      @books = User.find(current_user.id).books

    else
      @books = []
    end

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @books }
      end
  end
  
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  def create
    @book = Book.new(params[:book])
    @book.user = current_user

    # if @book.isbn?
    #   # if @book.title == nil || @book.author == nil || @book.avatar == nil
    #   @book.isbn_lookup
    # end

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  
  end

=begin
  1) url.we/path?key=value&key2=value2 ==>> params = {key: value, key2: value2}
  2) url.com/path/with/3 +
      config: match '/path/with/:id'
      ==>> params = {id: 3}
  3) form_for @book do |f| ... end ==>
    params = {book: {hash_of_books_stuff} }
=end

  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json

  # PUT /books/1
  # PUT /books/1.json

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json

  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  def avatar
  
  end

end
