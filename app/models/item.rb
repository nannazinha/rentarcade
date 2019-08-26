class Item < ApplicationRecord
  belongs_to :user
  validates :type, inclusion: { in: ["Console", "Game"], message: "Not a valid type" }
  validates :console_manufacturer, presence: true
  validates :console_model, presence: true
  validates :game_title, presence: true, if: :type == "Game"
end
