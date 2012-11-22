class Post < ActiveRecord::Base
  attr_accessible :content, :title
  
  validates_presence_of :title, :content, :user_id 

  belongs_to :user
  #
  has_many :comments, dependent: :destroy
  #
  has_many :user_comments, dependent: :destroy
  has_many :anonymous_comments, dependent: :destroy
end
