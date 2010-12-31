class AddCountsToLog < ActiveRecord::Migration
  def self.up
    add_column :logs, :mod_count, :integer
    add_column :logs, :mod_component_count, :integer
  end

  def self.down
    remove_column :logs, :mod_count
    remove_column :logs, :mod_component_count
  end
end
