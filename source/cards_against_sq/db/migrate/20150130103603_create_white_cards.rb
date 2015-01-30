class CreateWhiteCards < ActiveRecord::Migration

  def change
    create_table :white_cards do |t|
      t.string :text
      t.integer :player_id
      t.boolean :played

      t.timestamps
    end
  end
end
