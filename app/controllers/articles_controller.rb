class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(:id).paginate(page: params[:page], per_page: 5)    
  end
 
  def show
    @article = Article.find(params[:id])
  end
 
  def new
    @article = Article.new
  end
 
  def edit
    @article = Article.find(params[:id])
  end
 
  def create
    @article = Article.new(article_params)
 
    if @article.save      
      @article.delay.status
      redirect_to @article
    else
      render 'new'
    end
  end
 
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to root
  end  

  def export_file
    @article = Article.find(params[:article_id])
    @article.delay(run_at: 5.second.from_now).create_file(@article)
    redirect_to articles_path
    
    puts "redirect successssssssssssssssssssssssssssssssssss"    
  end  
 
  private
    def article_params
      params.require(:article).permit(:title, :text, :avatar)
    end    
end
