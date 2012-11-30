require "spec_helper"

describe CommentsController do
  #antes de entrar a cualquiera de los examples debe crearse un post.
  before(:all) do
    @test_post = create(:post)
  end

  it  "if login user, should allow to enter a new user_comment into a post and save if it is correct, and show the post page with a flash message " do
    
    login_user

    expect {
      post :create, {
        post_id: @test_post.id,
        user_comment: attributes_for(:user_comment) 
      }  
    }.to change {@test_post.comments.count}.by(1)
    flash[:notice].should_not be_nil
    response.should redirect_to(post_path(@test_post))   
  end

end