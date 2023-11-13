module Hubspot
  class ErrorRequest < StandardError; end

  class Request < Micro::Case::Safe
    attributes :url, :options

    def call!
      valid!

      Success result: { response: request }
    end

    private

    def request
      @request ||= HTTParty.send(options[:method], link, body: options[:body].to_json, headers: headers)
    end

    def headers
      @headers ||=
        { Authorization: "Bearer #{options[:token]}", "Content-Type": "application/json" }
    end

    def query
      @query ||= options[:query] || ""
    end

    def link
      @link ||= "#{url}?#{query}"
    end

    def valid!
      return handle_exception(:invalid_url) if url.nil?
      return handle_exception(:invalid_token) if options[:token].nil?
      return handle_exception(:indefinied_method) if options[:method].nil?
    end

    def handle_exception(key = nil)
      message = {
        invalid_arguments: "Hubspot arguments are not valid",
        invalid_token: "Hubspot token is not valid",
        indefinied_method: "Hubspot method is not valid",
        invalid_url: "Hubspot url is not valid"
      }

      raise ErrorRequest, message[key] unless message[key].nil?
    end
  end
end
