module ReqRep
  class Builder
    def self.parse_file(config)
      #if config =~ /\.rr$/
        cfgfile = ::File.read(config)
        #if cfgfile[/^#\\(.*)/] && opts
        #  options = opts.parse! $1.split(/\s+/)
        #end
        cfgfile.sub!(/^__END__\n.*\Z/m, '')
        app = new_from_string cfgfile, config
      #end
      return app
    end

    def self.new_from_string(builder_script, file="(rackup)")
      eval "ReqRep::Builder.new {\n" + builder_script + "\n}",
        TOPLEVEL_BINDING, file, 0
    end


    def initialize(default_app = nil, &block)
      @use, @run = [], nil, default_app

      instance_eval(&block) if block_given?
    end


    # Rack Builder API Compat Mode
    def use(middleware, *args, &block)
      @use << proc { |app| middleware.new(app, *args, &block) }
    end

    def run(app)
      @run = app
    end


    def call(req, rep)
      @use.reverse.inject(@run) { |a,e| e[a] }.call(req, rep)
    end
  end
end
