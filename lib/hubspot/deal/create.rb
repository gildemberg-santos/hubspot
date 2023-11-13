# frozen_string_literal: true

module Hubspot
  module Deal
    class ErrorCreate < StandardError; end

    class Create < Micro::Case::Safe
    end
  end
end
