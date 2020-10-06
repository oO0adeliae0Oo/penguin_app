class User < ApplicationRecord
    before_save { self.email = email.downcase}
    validates :name, presence:true, length: {maximum: 20}
    Valid_email = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence:true, length: {maximum: 250},
                format: { with: Valid_email },
                uniqueness: {case_sensitive: false}

end
