class CreateBlackCards < ActiveRecord::Migration

  def change
    create_table :black_cards do |t|
      t.string :text
      t.integer :player_id
      t.boolean :played

      t.timestamps
    end
  end
end
