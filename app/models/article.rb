class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_one_attached :image

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
  end
  