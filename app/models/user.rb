class User < ApplicationRecord
    has_many :microposts, dependent: :destroy
    before_save :downcase_email
    attr_accessor :remember_token
    validates :name, presence:true, length: {maximum: 20}
    Valid_email = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence:true, length: {maximum: 250},
                format: { with: Valid_email },
                uniqueness: {case_sensitive: false}

    has_secure_password
    validates :password, presence: true, length: {minimum: 5}, allow_nil: true

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = User.new_token
        self.update_attribute(:remember_digest,
            User.digest(remember_token))
    end

    def forget
        self.update_attribute(:remember_digest, nil)
    end

    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
                                                      BCrypt::Password.create(string, cost: cost)
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(self.remember_digest).is_password?(remember_token)
    end

    def feed
        Micropost.where("user_id = ?", self.id)
    end

    private

    def downcase_email
        self.email = self.email.downcase
    end

end
