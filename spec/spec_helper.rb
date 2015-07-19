require "bundler/setup"
require "morguefile/version"
require "morguefile"
require "ostruct"

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :should }
  config.mock_with(:rspec) { |c| c.syntax = :should }
end
