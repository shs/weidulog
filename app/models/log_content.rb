class LogContent < ActiveRecord::Base
  belongs_to :log

  before_create :read_log

  def regex
    /^~(?:(?:.+?)\/)?(?:SETUP-)?(.+?)\.TP2~\s#\d+\s#(\d+)\s\/\/\s(.+?)(?::\sv?([\d\.]+)\s?)?$/
  end

  private
    def read_log
      self.body = body.read
    end
end
