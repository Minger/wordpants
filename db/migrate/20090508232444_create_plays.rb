class CreatePlays < ActiveRecord::Migration
  def self.up
    create_table :plays do |t|
      t.integer :game_id
      t.integer :seat_id
      t.integer :row
      t.integer :column
      t.string :orientation
      t.string :word
      t.integer :score
      t.integer :sequence

      t.timestamps
    end
  end

  def self.down
    drop_table :plays
  end
end
