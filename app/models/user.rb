class User < ActiveRecord::Base
    before_save { self.email = self.email.downcase }
    with_options on: :create do |create|
        create.validates :name, presence: true, length: { maximum: 50 }
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        create.validates :email, presence: true, length: { maximum: 255 },
                                 format: { with: VALID_EMAIL_REGEX },
                                 uniqueness: { case_sensitive: false }
        has_secure_password
    end
    with_options on: :update do |update|
        update.validates :name, presence: true, length: { maximum: 50 },
                                allow_blank: true
        update.validates :email, presence: true, length: { maximum: 255 },
                                 format: { with: VALID_EMAIL_REGEX },
                                 uniqueness: { case_sensitive: false },
                                 allow_blank: true
    end
    validates :profile, length: { maximum: 255 }
    validates :location, length: { maximum: 255 }
    # validates :birthday, birthday: true
end
