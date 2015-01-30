class CreatePlayers < ActiveRecord::Mirgation

  def change
    create_table :person do |t|
      t.string :name
      t.integer :points

      t.timestamps
    end
end
