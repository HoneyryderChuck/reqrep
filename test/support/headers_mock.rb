class HeadersMock
  def initialize(headers={})
    @headers = headers
  end

  def get(key)
    @headers[key]
  end
end
