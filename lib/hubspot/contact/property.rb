# frozen_string_literal: true

module Hubspot
  module Contact
    class ErrorProperty < StandardError; end

    class Property < Micro::Case::Safe
    end
  end
end
