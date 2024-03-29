class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable, :registerable, :confirmable


  attr_accessible  :full_name, :email, :password, :password_confirmation, :remember_me,
                    :provider, :uid

  validates_presence_of :full_name

  validates :email, :presence => true, :uniqueness => :true

  has_many :likes
  
  has_many :posts, dependent: :destroy

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    
    unless user
      user = User.create(full_name:auth.extra.raw_info.name,
                             provider:auth.provider,
                             uid:auth.uid,
                             email:auth.info.email,
                             password:Devise.friendly_token[0,20]
                             )
    end
    user
  end

 def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
