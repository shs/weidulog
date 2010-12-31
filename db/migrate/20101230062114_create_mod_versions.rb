class CreateModVersions < ActiveRecord::Migration
  def self.up
    create_table :mod_versions, :force => true do |t|
      t.references :mod
      t.string :number
      t.timestamps
    end

    remove_column :mods, :version
  end

  def self.down
    drop_table :mod_versions
    add_column :mods, :version, :string
  end
end
