class AddEnabledToLanguages < ActiveRecord::Migration
  def self.up
    add_column :languages, :enabled, :boolean, :default => false
  end

  def self.down
    remove_column :languages, :enabled
  end
end
