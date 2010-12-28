class AddLogModComponentJoinTable < ActiveRecord::Migration
  def self.up
    create_table :logs_mod_components, :id => false do |t|
      t.references :log, :mod_component
    end
  end

  def self.down
    drop_table :logs_mod_components
  end
end
