class CreateVocabs < ActiveRecord::Migration
  def self.up
    create_table :vocabs do |t|
      t.string :english
      t.string :foreign
      t.references :level

      t.timestamps
    end
  end

  def self.down
    drop_table :vocabs
  end
end
