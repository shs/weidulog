class Mod::Version < ActiveRecord::Base
  belongs_to :mod
  has_and_belongs_to_many :logs
end
