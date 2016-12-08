class User < ActiveRecord::Base
    before_save { self.email = self.email.downcase }
    create.validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    create.validates :email, presence: true, length: { maximum: 255 },
                             format: { with: VALID_EMAIL_REGEX },
                             uniqueness: { case_sensitive: false }
    has_secure_password
    validates :profile, length: { maximum: 255 }, allow_blank: true
    validates :location, length: { maximum: 255 }, allow_blank: true
    # validates :birthday, birthday: true
    has_many :microposts
end
