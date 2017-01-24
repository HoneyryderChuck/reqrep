module ReqRep
  module Request

    def content_length
      headers.get("content-length") || -1
    end

    # @return [URI] uri as an object
    def uri
      URI.parse(url)
    end
  end
end
