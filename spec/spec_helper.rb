require 'awesome_zanox'
require 'rspec'
require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def with_fixture(file)
  { body: fixture(file), headers: { content_type: 'application/json; charset=utf-8' } }
end

def stub_get(path)
  stub_request(:get, /.*#{AwesomeZanox::Client::API_URL + path}*/)
end
