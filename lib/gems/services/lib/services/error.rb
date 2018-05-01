module Services
  class Error < StandardError
    attr_reader :reason, :status, :messages, :data

    def initialize(reason, status: :unprocessable_entity, messages: nil, data: nil)
      @reason = reason
      @status = status
      @messages = messages
      @data = data
    end

    def success?
      false
    end

    def error?
      true
    end

    def messages
      @messages || [ { key: reason, value: I18n.t("errors.#{reason}") } ]
    end

    def message
      messages.try(:first).try(:fetch, :value)
    end
  end
end
