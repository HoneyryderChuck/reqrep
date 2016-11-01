require "optparse"

module ReqRep
  class Server
    DEFAULTOPTIONS={
      host: "localhost",
      port: 9002,
    }

    def initialize(argv = ARGV)
      @options = parse(argv, DEFAULTOPTIONS)
      bootfilepath = argv[-1]
      @bootfile = (bootfilepath && !bootfilepath.empty?) ? bootfilepath : "config.rr"
    end


    def run
      if includes = options[:include]
        $LOAD_PATH.unshift(*includes)
      end
    end

    private
 
    def app
      return @app if defined?(@app)

      @app = begin
        if !::File.exist? @options[:config]
          abort "configuration #{@options[:config]} not found"
        end

        app = ReqRep::Builder.parse_file(@options[:config])
      end
    end
 
    def parse(argv, **options)
      OptionParser.new do |opts|
        opts.banner = "Usage: requp [ruby options] [rr options] [rr config]"

        opts.separator ""
        opts.separator "Ruby options:"

        opts.on("-d", "--debug", "set debugging mode") {
          options[:debug] = true
        }

        opts.on("-I", "--include PATH",
                "specify $LOAD_PATH (may be used more than once)") { |path|
          (options[:include] ||= []).concat(path.split(":"))
        }

        opts.on("-s", "--server SERVER", "serve using SERVER") { |s|
          options[:server] = s
        }

        opts.on("-o", "--host HOST", "listen on HOST (default: #{DEFAULTOPTIONS[:host]})") { |host|
          options[:host] = host
        }

        opts.on("-p", "--port PORT", "use PORT (default: #{DEFAULTOPTIONS[:port]})") { |port|
          options[:port] = port
        }

        opts.on("-E", "--env ENVIRONMENT", "use ENVIRONMENT for defaults (default: development)") { |e|
          options[:environment] = e
        }

        opts.on_tail("-h", "-?", "--help", "Show this message") do
          puts opts
          exit(0)
        end

        opts.on_tail("--version", "Show version") do
          puts ReqRep::VERSION
          exit(0)
        end
      end.parse!(argv)
      options
    end
  end
end
