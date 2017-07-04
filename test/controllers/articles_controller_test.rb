require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should create article" do
    assert_difference('Article.count') do
    	post :create, article: {title: 'Title', text: 'This is content.'}
  	end 
  	assert_redirected_to article_path(assigns(:article))
  	assert_equal 'Article was successfully created.', flash[:notice]
  end  
  
  test "index render correct template" do
  	get :index
  	assert_template :index
  end

  test "new article should render correct partial" do
  	get :new
  	assert_template :new, partial: "_form"  	
  end

end
