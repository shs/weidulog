class CreateMods < ActiveRecord::Migration
  def self.up
    create_table :mods do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :mods
  end
end
