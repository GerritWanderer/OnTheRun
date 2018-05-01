module Services
  module Service
    extend ActiveSupport::Concern

    class_methods do
      attr_reader :transaction_class

      def wrap_in_transaction(transaction_class = ActiveRecord::Base)
        @transaction_class = transaction_class
      end

      def invoke(args = {})
        instance = new()
        args.keys.each do |key|
          if instance.respond_to? "#{key}="
            instance.send("#{key}=", args[key])
          else
            raise(ArgumentError, "#{key} is not a valid argument for #{instance}")
          end
        end
        if transaction_class
          result = nil
          transaction_class.transaction do
            result = instance.invoke
            raise ActiveRecord::Rollback unless result.success?
          end
          result
        else
          instance.invoke
        end
      end
    end

    protected
    def success(*args)
      return Success.new(*args)
    end

    def error(*args)
      return Error.new(*args)
    end

    def validation_error(*args)
      return ValidationError.new(*args)
    end
  end
end
