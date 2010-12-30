class Mod < ActiveRecord::Base
  has_many :components
  has_many :versions
  has_and_belongs_to_many :logs
end
