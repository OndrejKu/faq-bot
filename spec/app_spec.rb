require_relative './spec_helper.rb'
require_relative '../app.rb'

RSpec.describe App  do
  it 'Process the API.AI request' do
    get '/sinatra'
    expect(last_response).to be_ok
  end
end