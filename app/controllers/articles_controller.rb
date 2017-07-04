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
    file = File.open("/home/local/ELARION/thangnpd/Desktop/#{@article.title}.txt", "w") do |f|
      f.write "The content of article is #{@article.text}"
      puts "Write file OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK"
      f.close
      puts "File is close OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK"
    end

    redirect_to articles_path
    puts "redirect success"

    # respond_to do |format|
    #   format.html
    #   format.csv { send_data @article.to_csv, :filename => "#{@article.title}.csv" }
    # end
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :text, :avatar)
    end
end
