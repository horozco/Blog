class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  
  validates_presence_of :title, :content, :user_id 

  belongs_to :user
  #
  has_many :comments
  #

end
