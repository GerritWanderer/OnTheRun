module Services
  class ValidationError < Error
    def initialize(model)
      flat_messages = model.errors.to_hash(true).flat_map do |key, messages|
        messages.map { |message| { key: key, value: message } }
      end
      super(:validation, messages: flat_messages, data: model)
    end
  end
end
