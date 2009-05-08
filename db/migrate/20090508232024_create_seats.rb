class CreateSeats < ActiveRecord::Migration
  def self.up
    create_table :seats do |t|
      t.integer :game_id
      t.integer :user_id
      t.string :letters
      t.integer :position
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :seats
  end
end
