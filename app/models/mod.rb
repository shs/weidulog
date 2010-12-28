class Mod < ActiveRecord::Base
  has_many :components, :class_name => 'ModComponent'
  has_and_belongs_to_many :logs
end
