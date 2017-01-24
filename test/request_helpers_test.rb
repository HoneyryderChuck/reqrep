require_relative "test_helper"
require "reqrep/request"

class ReqRepRequest < Minitest::Test

  def test_verb
    get  = RequestMock.new(verb: "GET")
    post = RequestMock.new(verb: "POST")

    assert get.verb == "GET", "get verb must be GET"
    assert post.verb == "POST", "get verb must be POST"
  end

  def test_uri
    req = RequestMock.new(url: "/")
    uri = req.uri

    assert uri.path  == "/", "request path is unexpected"
    assert uri.query == nil, "request query is unexpected"

    req2 = RequestMock.new(url: "/admin?id=1")
    uri2 = req2.uri

    assert uri2.path  == "/admin", "request path is unexpected"
    assert uri2.query == "id=1", "request query is unexpected"
  end

  def test_content_length
    req = RequestMock.new
    assert req.content_length == -1, "content length is unexpected"

    req2 = RequestMock.new(headers: {"content-length" => 5})
    assert req2.content_length == 5, "content length is unexpected"
  end

  def test_transfer_encoding

  end

  def test_form

  end

  def post_form

  end

  def multipart_form

  end

  def trailer

  end

  def remote_addr

  end

  def request_uri

  end

  def tls

  end

  private

  def request
    @request ||= RequestMock.new
  end

end



