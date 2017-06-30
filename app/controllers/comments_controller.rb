class CommentsController < ApplicationController
    before_action :find_article_id 

  def index		
	@comments = @article.comments.all
  end
  def create    
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
 
  private
  	def find_article_id
  	  @article = Article.find(params[:article_id])
  	end

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end