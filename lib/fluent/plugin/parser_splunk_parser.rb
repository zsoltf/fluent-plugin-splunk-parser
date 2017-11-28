#
# Copyright 2017- TODO: Write your name
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "fluent/plugin/parser"

module Fluent::Plugin
  class SplunkParser < Parser
    # Register this parser as "splunk"
    Fluent::Plugin.register_parser("splunk_parser", self)

    config_param :delimiter, :string, default: "|"   # delimiter is configurable with " " as default
    config_param :time_format, :string, default: nil # time_format is configurable

    def configure(conf)
      super

      if @delimiter.length != 1
        raise ConfigError, "delimiter must be a single character. #{@delimiter} is not."
      end

      # TimeParser class is already given. It takes a single argument as the time format
      # to parse the time string with.
      @time_parser = Fluent::TimeParser.new(@time_format)
    end

    def parse(text)
      time, key_values = text.split(@delimiter, 2)
      time = @time_parser.parse(time)
      record = {}
      key_values.split(@delimiter).each { |kv|
        k, v = kv.split("=", 2)
        record[k] = v
      }
      yield time, record
    end
  end
end
