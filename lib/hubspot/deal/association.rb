# frozen_string_literal: true

module Hubspot
  module Deal
    class ErrorAssociation < StandardError; end

    class Association < Micro::Case::Safe
    end
  end
end
