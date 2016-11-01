module ReqRep
  module Handler
    # code bits from rack


    def self.get(server)
      return unless server
      server = server.to_s

      unless handlers.include? server
        load_error = try_require('reqrep/handler', server)
      end

      if klass = handlers[server]
        klass.split("::").inject(Object) { |o, x| o.const_get(x) }
      else
        const_get(server, false)
      end

    rescue NameError => name_error
      raise load_error || name_error
    end


    def self.try_require(prefix, const_name)
      file = const_name.gsub(/^[A-Z]+/) { |pre| pre.downcase }.
        gsub(/[A-Z]+[^A-Z]/, '_\&').downcase

      require(::File.join(prefix, file))
      nil
    rescue LoadError => error
      error
    end

    def self.handlers ; @handlers ||= {} ; end

    def self.register(server, klass)
      handlers[server.to_s] = klass.to_s
    end

  end
end
