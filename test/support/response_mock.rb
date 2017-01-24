# this must respect the minimal request API to be implemented
class ResponseMock
  include ReqRep::Response
  def initialize(status: 200, version: "2.0", headers: {}, body: nil) 
    @status  = status
    @version = version
    @headers = HeadersMock.new(headers)
    @body    = Array(body)
  end

  def status 
    @status
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
end

