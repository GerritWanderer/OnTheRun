module Services
  class HttpError < Error
    def initialize(status)
      super(status, status: status)
    end
  end
end