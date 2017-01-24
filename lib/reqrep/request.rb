module ReqRep
  module Request
    def host
      headers.get(":authority") ||
      headers.get("host") ||
      uri.select(:host, :port).compact.join(":")
    end

    def content_length
      headers.get("content-length") || -1
    end

    # @return [URI] uri as an object
    def uri
      URI.parse(url)
    end
  end
end
