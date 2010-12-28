class CreateModComponents < ActiveRecord::Migration
  def self.up
    create_table :mod_components do |t|
      t.references :mod
      t.integer :number
      t.string :label
      t.timestamps
    end
  end

  def self.down
    drop_table :mod_components
  end
end
