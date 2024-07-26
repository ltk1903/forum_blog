class User < ApplicationRecord
    has_secure_password
    has_many :comments, dependent: :destroy
    has_one_attached :avatar

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }

    def admin?
        role == 'admin'
    end
end
