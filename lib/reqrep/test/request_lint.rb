module ReqRep
  module Test
    module RequestLint

      def test_verb
        assert request.respond_to?(:verb), "request should respond to #verb"
        assert request.verb.is_a?(String), "verb should be a string"
        assert %w(GET POST PUT PATCH DELETE OPTIONS).include?(request.verb),
          "#{request.verb} is not a valid http verb"
      end

      def test_version
        assert request.respond_to?(:version), "request should respond to #version"
        assert %w(1 1.0 1.1 2).include?(request.version),
          "request version if unsupported"
      end 

      def test_headers
        assert request.respond_to?(:headers); "request should respond to #headers"
        assert request.headers.respond_to?(:[]), "request headers should allow key lookup"
        assert request.headers.method(:[]).arity == 1, "request headers should allow key lookup"
        request.headers["key"] = "value"
        assert request.headers["key"] == "value", "request headers can be edited"
      end

      def test_body
        assert request.respond_to?(:body), "request should respond to #body"
        assert request.body.respond_to?(:each), "request body should respond to #each"
      end

      def test_url
        assert request.respond_to?(:url), "request should respond to #url"
        assert request.url.is_a?(String), "request url should be a string"
      end

      def test_params
        # TODO: is it needed?
      end
    end
  end
end
