class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    has_many :comments, dependent: :destroy
    has_one_attached :avatar
  
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }, on: :create
    validates :password, length: { minimum: 6 }, allow_blank: true, on: :update
  
    def admin?
      role == 'admin'
    end
  end
  