class AddLanguageRelationships < ActiveRecord::Migration
  def self.up
    add_column :levels, :language_id, :integer
  end

  def self.down
    remove_column :levels, :language_id
  end
end
