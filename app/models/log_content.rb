class LogContent < ActiveRecord::Base
  belongs_to :log

  before_create :read_log

  private
    def read_log
      self.body = body.read
    end
end
