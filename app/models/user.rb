class User < ApplicationRecord
    before_save { email.downcase! }
    validates :name, presence:true, length: {maximum: 20}
    Valid_email = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence:true, length: {maximum: 250},
                format: { with: Valid_email },
                uniqueness: {case_sensitive: false}
    has_secure_password
    validates :password, presence: true, length: {minimum: 5}
end
