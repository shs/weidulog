class RenameModNameColumn < ActiveRecord::Migration
  def self.up
    rename_column(:mods, :name, :tp2_name)
  end

  def self.down
    rename_column(:mods, :tp2_name, :name)
  end
end
