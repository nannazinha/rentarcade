class Item < ApplicationRecord
  belongs_to :user
  validates :category, inclusion: { in: ["Console", "Jogo"], message: "Not a valid type" }
  validates :console_model, presence: true
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
end
