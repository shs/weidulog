class Mod < ActiveRecord::Base
  has_many :components
  has_many :versions
  has_and_belongs_to_many :logs

  before_create :guess_name

  private
    def guess_name
      self.name = tp2_name.titleize.gsub(/(bgt?|npc)/i){$1.upcase} if name.blank?
    end
end
