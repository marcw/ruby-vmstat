# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
$:.unshift(File.expand_path("../lib", __FILE__))

# load extension
begin
  require "vmstat/vmstat"
rescue LoadError => exception
  puts "Extension not compiled yet, compiling ..."
  system "rake compile"
end

require 'vmstat'
require 'ostruct'
require 'timecop'

def travis?
  ENV['TRAVIS'] == 'true'
end

def docker?
  File.exist?("/.dockerenv")
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
