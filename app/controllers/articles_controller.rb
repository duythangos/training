class ArticlesController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]


  def index
    @articles = Article.all.order(:id).paginate(page: params[:page], per_page: 5)
  end

  def show

  end

  def new
    console
    @article = Article.new
  end

  def edit

  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    render json: {status: "delete success"}
  end

  def export_file
    @article = Article.find(params[:article_id])
    @article.delay(run_at: 30.seconds.from_now).create_file @article
    redirect_to articles_path

    puts "redirect successssssssssssssssssssssssssssssssssss"
  end

  def update_status
    @article = Article.find(params[:article_id])
    if @article.image_upload_status == true
      render json: {status: "fail"}
      puts "update NOTTTTTTTTTT okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
    else
      @article.update_column(:image_upload_status, 'true')
      render json: {status: "ok"}
      puts "update okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :avatar, :image_upload_status)
  end

  def find_id
    @article = Article.find(params[:id])
  end

end
