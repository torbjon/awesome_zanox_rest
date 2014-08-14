require 'spec_helper'

describe AwesomeZanox::Client do
  before do
    @client = AwesomeZanox::Client.new('someId', 'someSecret')
  end

  it 'respond to publisher' do
    expect(@client).to respond_to(:publisher)
    expect(@client.publisher).to respond_to(:profiles)
  end
end
