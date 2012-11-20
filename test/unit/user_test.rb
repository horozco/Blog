require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter a full name" do
	     user = User.new
	     assert !user.save
	     assert !user.errors[:full_name].empty?
	end

	  test "a user should enter a email" do
	     user = User.new
	     assert !user.save
	     assert !user.errors[:email].empty?
	end

	  test "a user should enter a password" do
	     user = User.new
	     assert !user.save
	     assert !user.errors[:password].empty?
	end

	test "a user should enter a password confirmation" do
	     user = User.new
	     assert !user.save
	     assert !user.errors[:password_confirmation].empty?
	end

	test "a user should have a unique email" do
     user = User.new
     user.full_name = "Hernan Orozco"
     #correo de un usuario existente
     user.email = "horozco@gmail.com"
     user.password = "Hernan"
     user.password_confirmation = "Hernan"
     #puts user.errors.inspect
     assert !user.save
     assert !user.errors[:email].empty?
  end
end
