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
    @author = params[:id]
  end


end
