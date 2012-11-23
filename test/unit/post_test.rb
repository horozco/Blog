require 'test_helper'

class PostTest < ActiveSupport::TestCase
	test "a post should have a title" do
	     post = Post.new
	     post.content = "apple"
	     post.user_id = 2
	     assert !post.save
	     assert !post.errors[:title].empty?
	end	
	test "a post should have a content" do
	     post = Post.new
	     post.title = "apple"
	     post.user_id = 2
	     assert !post.save
	     assert !post.errors[:content].empty?
	end	
	test "a post should have a post id" do
	     post = Post.new
	     post.title = "apple"
	     post.content = "pear"
	     assert !post.save
	     assert !post.errors[:user_id].empty?
	end	
end
