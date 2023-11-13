# frozen_string_literal: true

module Hubspot
  module Contact
    class ErrorCreate < StandardError; end

    class Create < Micro::Case::Safe
    end
  end
end
