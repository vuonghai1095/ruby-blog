class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:show, :index]
  def index
    #debugger
    @articles = Article.paginate(page: params[:page], per_page: 2)
    if @articles.empty?
      flash[:notice] = "No record on page #{params[:page]}"
    end
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
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit

  end
  
  def update    
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    if @article.destroy
      flash[:notice] = "Article was successfully deleted"
      redirect_to articles_path
    else
      flash[:notice] = "Article couldn't delete"
    end
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description, :user)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
