gem "minitest"
require "minitest/autorun"

require "reqrep"

Dir[File.join(".", "test", "support", "**", "*.rb")].each { |f| require f }


