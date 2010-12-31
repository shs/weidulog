class RenameLogModComponentColumn < ActiveRecord::Migration
  def self.up
    rename_column(:logs_mod_components, :mod_component_id, :component_id)
  end

  def self.down
    rename_column(:logs_mod_components, :component_id, :mod_component_id)
  end
end
