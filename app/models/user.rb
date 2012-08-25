class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile_attributes, :role_ids,
                  :provider, :uid, :profile
  # attr_accessible :title, :body

  has_and_belongs_to_many :roles
  has_and_belongs_to_many :categories
  has_one :profile
  accepts_nested_attributes_for :profile

  def role?(role)
  	return !!self.roles.find_by_name(role.to_s.camelize)
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      role = Role.find_by_name("User")
      profile = Profile.create(fname:auth.extra.raw_info.first_name,
                               lname:auth.extra.raw_info.last_name,
                               gender:auth.extra.raw_info.gender)
      user = User.create(profile:profile,
                          provider:auth.provider,
                          uid:auth.id,
                          email:auth.info.email,
                          password:Devise.friendly_token[0,20],
                          role_ids:role.id)
    end
    user
  end

  def self.new_with_sessions(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end