class AddNumberToLevels < ActiveRecord::Migration
  def self.up
    add_column :levels, :number, :integer
  end

  def self.down
    remove_column :levels, :number
  end
end
