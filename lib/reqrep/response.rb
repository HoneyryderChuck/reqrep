module ReqRep
  module Response
    def content_length
      headers.get("content-length") || -1
    end
  end
end
