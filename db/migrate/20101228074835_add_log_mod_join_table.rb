class AddLogModJoinTable < ActiveRecord::Migration
  def self.up
    create_table :logs_mods, :id => false do |t|
      t.references :log, :mod
    end
  end

  def self.down
    drop_table :logs_mods
  end
end
