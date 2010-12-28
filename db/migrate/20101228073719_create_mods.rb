class CreateMods < ActiveRecord::Migration
  def self.up
    create_table :mods do |t|
      t.string :name, :version
      t.timestamps
    end
  end

  def self.down
    drop_table :mods
  end
end
