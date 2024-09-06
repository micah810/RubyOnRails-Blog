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
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
      # the purpose of the new New Action prepares a blank article for a form
      # the default of it is to render the form page from app/views/articles/new.html.erb
      # the setup helps create and save articles/fix errors if something goes wrong
    end
  end

    def edit
      @article = Article.find(params[:id])
    end
    # The edit action gets the article from the database and stores
    # it in @article for use in the form.
    # By default, it renders app/views/articles/edit.html.erb.
    def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to @article
      else
        render :edit, status: :unprocessable_entity
      end
      # The update action refetches the article, updates it with form data,
      # and redirects if successful. If errors occur, it redisplays the form with error messages.
    end


    private
    def article_params
      params.require(:article).permit(:title, :body)
    end
  end

