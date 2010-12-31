class CreateLogContents < ActiveRecord::Migration
  def self.up
    create_table :log_contents do |t|
      t.references :log
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :log_contents
  end
end
