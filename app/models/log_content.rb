class LogContent < ActiveRecord::Base
  belongs_to :log

  before_validation :read_log
  validate :valid_log

  attr_accessor :file

  def regex
    /^~(?:(?:.+?)\/)?(?:SETUP-)?(.+?)\.TP2~\s#\d+\s#(\d+)\s\/\/\s(.+?)(?::\sv?([\d\.]+)\s?)?$/
  end

  private
    def read_log
      self.body = file.read
    end

    def valid_log
      errors.add(:file, 'is not a valid WeiDU log') unless body.match(regex)
    end
end
