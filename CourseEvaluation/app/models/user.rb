class User < ApplicationRecord
    has_secure_password
    belongs_to :gender
    has_many :comments
    has_many :marks
    has_many :likes, through: :comments,dependent: :destroy 
    
    attr_accessor :remember_token

    validates :user_name, presence: true
    validates :email, presence: true
    validates :user_name, length: { minimum:2, maximum: 50}
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Email Format Invalid" }
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, presence: true
    validates :password_confirmation, presence: true

    def remember
        self.remember_token = User.new_token
        self.update_attribute(:remember_digest, User.digest(remember_token))
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
         BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
        self.remember_digest = nil
    end

    class << self
        def digest(string)
          cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                        BCrypt::Engine.cost
          BCrypt::Password.create(string, cost: cost)
        end
    
        def new_token
          SecureRandom.urlsafe_base64
        end
    end
end
