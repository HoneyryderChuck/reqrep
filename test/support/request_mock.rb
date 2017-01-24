# this must respect the minimal request API to be implemented
class RequestMock
  include ReqRep::Request
  def initialize(verb: "GET", version: "2.0", headers: {}, body: nil, url: "/") 
    @verb    = verb
    @version = version
    @headers = HeadersMock.new(headers)
    @body    = Array(body)
    @url     = url 
  end

  def verb
    @verb
  end

  def version
   @version 
  end

  def headers
    @headers
  end

  def body
    @body
  end

  def url
    @url
  end
end
