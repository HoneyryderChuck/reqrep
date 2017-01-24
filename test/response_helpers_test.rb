require_relative "test_helper"
require "reqrep/response"

class ReqRepResponse < Minitest::Test

  def test_status
    req = ResponseMock.new(status: 200)
    assert req.status == 200, "content length is unexpected"
    req2 = ResponseMock.new(status: 302)
    assert req2.status == 302, "content length is unexpected"
  end

  def test_content_length
    req = ResponseMock.new
    assert req.content_length == -1, "content length is unexpected"

    req2 = ResponseMock.new(headers: {"content-length" => 5})
    assert req2.content_length == 5, "content length is unexpected"
  end

  def test_transfer_encoding

  end

  def trailer

  end

  def tls

  end

  private

  def response
    @response ||= ResponseMock.new
  end

end




