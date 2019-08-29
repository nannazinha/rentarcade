class Item < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :reviews, dependent: :destroy
  validates :category, inclusion: { in: ["Console", "Jogo"], message: "Not a valid type" }
  validates :console_model, presence: true
end
