class LogContent < ActiveRecord::Base
  belongs_to :log

  before_validation :read_log
  validates_presence_of :file
  validate :valid_log

  attr_accessor :file

  def regex
    /^~(?:(?:.+?)\/)?(?:SETUP-)?(.+?)\.TP2~\s#\d+\s#(\d+)\s\/\/\s(.+?)(?::\sv?([\d\.]+)\s?)?$/
  end

  private
    def read_log
      self.body = file.try(:read)
    end

    def valid_log
      errors.add(:file, 'is not a valid WeiDU log') unless body.try(:match, regex)
    end
end
