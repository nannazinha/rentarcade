class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :console_model
      t.string :game_title
      t.string :category

      t.timestamps
    end
  end
end
