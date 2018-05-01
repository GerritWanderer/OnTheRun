module Services
  class Success
    attr_reader :data

    def initialize(data = nil)
      @data = data
    end

    def success?
      true
    end

    def error?
      false
    end
  end
end
