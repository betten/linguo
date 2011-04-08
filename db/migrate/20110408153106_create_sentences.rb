class CreateSentences < ActiveRecord::Migration
  def self.up
    create_table :sentences do |t|
      t.text :english
      t.text :foreign
      t.references :level

      t.timestamps
    end
  end

  def self.down
    drop_table :sentences
  end
end
