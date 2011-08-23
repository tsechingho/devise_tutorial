class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :authentications_attributes, :profile_attributes

  has_many :authentications, :as => :resource, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  has_one :profile, :as => :resource, :dependent => :destroy
  accepts_nested_attributes_for :profile

  class << self
    def find_with_facebook_oauth(access_token, signed_in_resource = nil)
      user = User.find_by_email(access_token['extra']['user_hash']['email'])
      user = User.create_with_facebook_token(access_token) unless user
      user
    end

    def create_with_facebook_token(access_token)
      info = access_token['user_info']
      extra = access_token['extra']['user_hash']
      create(
        :email => (info['email'] || extra['email']),
        :password => Devise.friendly_token[0,20], # stub password
        :authentications_attributes => [{
          :provider => access_token['provider'],
          :uid => access_token['uid'],
          :uname => (info['nickname'] || extra['username']),
          :uemail => (info['email'] || extra['email'])
        }],
        :profile_attributes => {
          :first_name => (info['first_name'] || extra['first_name']),
          :last_name => (info['last_name'] || extra['last_name']),
          :fullname => (info['name'] || extra['name']),
          :nickname => (info['nickname'] || extra['username'])
        }
      )
    end

    def new_with_session(params, session)
      data = session['devise.facebook_data']
      super.tap do |user|
        if data && data['extra']['user_hash']
          user.email = data['email']
        end
      end
    end
  end

  def name
    profile ? profile.nickname : email
  end
end
