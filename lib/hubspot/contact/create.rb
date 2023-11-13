# frozen_string_literal: true

module Hubspot
  module Contact
    class ErrorCreate < StandardError; end

    class Create < Micro::Case::Safe
      BASE_URL = 'https://api.hubapi.com/crm/v3/objects/contacts'
      attributes :properties_fields, :token

      def call!
        Success(result: response)
      end

      private

      def response
        return { id: request["id"], type: :success } unless request["id"].nil?
        return { id: extract_id(request["message"]), type: :conflict } if request["status"] == "error" && request["category"] == "CONFLICT"
        handle_exception(ErrorCreate.new(request["message"])) if request["status"] == "error"
          
        handle_exception(ErrorCreate.new("Contact not created"))
      end

      def extract_id(message)
        message.scan(/\d+/).first
      end

      def request
        @request ||= Hubspot::Request.call(url: BASE_URL, options: {method: :post, body: payload, token: token})
        @request.success? ? @request.data[:response] : handle_exception(@request.data[:exceptions])
      end

      def payload
        {
          properties: {}.merge(properties_fields)
        }
      end

      def handle_exception(exception)
        raise exception
      end
    end
  end
end
