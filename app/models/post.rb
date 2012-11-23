class Post < ActiveRecord::Base
  attr_accessible :content, :title, :post_image
  
  validates_presence_of :title, :content, :user_id 

  belongs_to :user
  #
  has_attached_file :post_image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
  					:url => "/assets/posts/:id/:style/:basename.:extension",
  					:path => ":rails_root/public/assets/posts/:id/:style/:basename.:extension"
  validates_attachment :post_image,
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"]  },
  :size => { :less_than => 3.megabytes }
  #
  has_many :comments, dependent: :destroy
  #
  has_many :user_comments, dependent: :destroy
  has_many :anonymous_comments, dependent: :destroy
end
