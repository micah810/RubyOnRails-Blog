class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: "...", body: "...")

    if @article.save
      redirect_to @article
    else
      # the purpose of the new New Action prepares a blank article for a form
      # the default of it is to render the form page from app/views/articles/new.html.erb
      # the setup helps create and save articles/fix errors if something goes wrong
      render :new, status: :unprocessable_entity
    end
    private
    def article_params
      params.require(:article).permit(:title, :body)
    end
  end
end
