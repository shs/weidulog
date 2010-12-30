class RenameLogModComponentTable < ActiveRecord::Migration
  def self.up
    rename_table('logs_mod_components', 'components_logs')
  end

  def self.down
    rename_table('components_logs', 'logs_mod_components')
  end
end
