class AddLogModVersionJoinTable < ActiveRecord::Migration
  def self.up
    create_table :logs_mod_versions, :id => false do |t|
      t.references :log, :version
    end
  end

  def self.down
    drop_table :logs_mod_versions
  end
end
