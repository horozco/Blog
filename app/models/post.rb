class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user
  #
  has_many :comments
  #
  belongs_to :user
end
