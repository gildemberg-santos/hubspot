# frozen_string_literal: true

module Hubspot
  module Contact
    class ErrorCreate < StandardError; end

    class Create < Micro::Case::Safe
      attributes :properties_fields, :associations_fields

      # TODO: Add validations, request to Hubspot API
      def call!
        Success(result: payload)
      end

      private

      def payload
        {
          inputs: [{}.merge(properties).merge(associations)]
        }
      end

      def properties
        {
          properties: {}.merge(properties_fields)
        }
      end

      def associations
        {
          associations: [
            {
              types: [{ "associationTypeId": associations_fields[:association_type_id] }],
              to: { id: associations_fields[:id] }
            },
          ]
        }
      end
    end
  end
end
