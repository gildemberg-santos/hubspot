# frozen_string_literal: true

module Hubspot
  module Contact
    class ErrorUpdate < StandardError; end

    class Update < Micro::Case::Safe
    end
  end
end
