module ReqRep
  module Test
    module ResponseLint
      def test_status
        assert response.respond_to?(:status), "response should respond do #status"
        assert response.status.is_a?(Integer), "response status should be an Integer"
        assert (100..599).include?(response.status), "response status should be of an acceptable range"
      end

      def test_headers
        assert response.respond_to?(:headers); "response should respond to #headers"
        assert response.headers.respond_to(:[]), "response headers should allow key lookup"
        assert response.headers.method(:[]).arity == 1, "response headers should allow key lookup"
        response.headers["key"] = "value"
        assert response.headers["key"] == "value", "response headers can be edited"
      end

      def test_body
        assert response.respond_to?(:body), "response should respond to #body"
        assert response.body.respond_to?(:each), "response body should respond to #each"
      end


      # TODO: should this really be part of lint?
      def test_flush
        assert response.respond_to?(:flush), "response should respond to #flush"
        assert response.method(:flush), "response should be passed a server protocol handle to work with"
      end
    end
  end
end
