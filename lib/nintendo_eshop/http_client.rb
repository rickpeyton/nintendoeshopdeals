require "net/http"
require "net/https"

module NintendoEshop
  module HttpClient
    def fetch(method, url)
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      req = set_method(method).new(uri)
      res = http.request(req)
      JSON.parse(res.body)
    rescue StandardError => e
      $logger.info("Fetch Failed: #{e.message}")
    end

  private

    def set_method(method)
      case method
      when :get
        Net::HTTP::Get
      end
    end
  end
end