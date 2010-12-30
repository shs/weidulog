class Log < ActiveRecord::Base
  belongs_to :game
  has_one :content, :class_name => 'LogContent'
  has_and_belongs_to_many :mods
  has_and_belongs_to_many :mod_components
end
