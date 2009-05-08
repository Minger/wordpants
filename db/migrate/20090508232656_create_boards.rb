class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards do |t|
      t.integer :game_id
      t.text :layout

      t.timestamps
    end
  end

  def self.down
    drop_table :boards
  end
end
