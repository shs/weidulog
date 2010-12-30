class AddModInfo < ActiveRecord::Migration
  def self.up
    add_column :mods, :name, :string
    add_column :mods, :author, :string
    add_column :mods, :description, :text
    add_column :mods, :website_url, :string
    add_column :mods, :forum_url, :string
  end

  def self.down
    remove_column :mods, :name
    remove_column :mods, :author
    remove_column :mods, :description
    remove_column :mods, :website_url
    remove_column :mods, :forum_url
  end
end
