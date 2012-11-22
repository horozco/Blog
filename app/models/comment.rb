class Comment < ActiveRecord::Base
  belongs_to :post
  has_many :likes
  attr_accessible :body, :commenter
  validates_presence_of :body
end
