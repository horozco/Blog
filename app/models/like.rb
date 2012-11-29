class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  validates_uniqueness_of :comment_id, :scope => :user_id
  #$("#like").html("<%= escape_javascript render('like_button') %>");
  #http://ruby.railstutorial.org/chapters/following-users#sec:a_working_follow_button_with_ajax
end