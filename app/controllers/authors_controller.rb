class AuthorsController < ApplicationController

  # For showing a list of all authors
  def index
    @authors = Author.all
  end

  # For creating new authors
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to root_url
    else
      render :new
    end

  end

  def author_params
    params.require(:author).permit(:name)
  end

  # For showing an author's articles
  def show
    @articles = Article.all
    @author_id = params[:id]
  end

  # For updating an Author
  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to root_url
    else
      render :new
    end

  end


end
