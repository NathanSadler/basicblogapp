class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @authors = Author.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      p @article.errors.full_messages
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  # Updates an article using submitted data from article_params
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :authors_id)
  end
end
