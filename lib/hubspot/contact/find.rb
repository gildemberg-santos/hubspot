module Hubspot
  module Contact
    class ErrorFind < StandardError; end

    class Find < Micro::Case::Safe
    end
  end
end
