class LogContent < ActiveRecord::Base
  belongs_to :log

  before_validation :read_log
  validate :valid_log

  def regex
    /^~(?:(?:.+?)\/)?(?:SETUP-)?(.+?)\.TP2~\s#\d+\s#(\d+)\s\/\/\s(.+?)(?::\sv?([\d\.]+)\s?)?$/
  end

  private
    def read_log
      self.body = body.read
    end

    def valid_log
      errors.add(body, 'is not a valid WeiDU log') unless body.match(regex)
    end
end
