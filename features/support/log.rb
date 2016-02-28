module Cucumber::Log
  class << self
    def error?
      !!@error
    end

    def report_error(e)
      @error = e
    end

    def reset
      @failed = nil
    end
  end
end
