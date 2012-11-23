class CommentMailer < ActionMailer::Base
  def new_comment_notify(post)  
  @post = post
      mail(:to => "#{post.user.full_name} <#{post.user.email}>", :subject => "New Comment on Your Post - Blog Scb", :from => "no-reply@blogscb.com")  
  end  
end
