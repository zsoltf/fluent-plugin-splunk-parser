require "helper"
require "fluent/plugin/parser_splunk_parser.rb"

class SplunkParserParserTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  test "failure" do
    flunk
  end

  private

  def create_driver(conf)
    Fluent::Test::Driver::Parser.new(Fluent::Plugin::SplunkParserParser).configure(conf)
  end
end
