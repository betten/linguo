class AddIsVocabToLevel < ActiveRecord::Migration
  def self.up
    add_column :levels, :is_vocab, :boolean
  end

  def self.down
    remove_column :levels, :is_vocab
  end
end
