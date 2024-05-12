# app/controllers/api_controller.rb

class ApiController < ApplicationController
  require 'faraday'
  require 'json'

  def fetch_data
    url = 'https://jsonplaceholder.typicode.com/posts'
    data = { title: 'foo', body: 'bar', userId: 1 }

    response = Faraday.post(url) do |req|
      req.headers['Content-Type'] = 'application/json'
      # Assuming @shipping_api_key is defined elsewhere, such as in an initializer or environment variable
      req.headers['Authorization'] = "Bearer #{@shipping_api_key}"
      req.body = data.to_json
    end

    if response.success?
      @data = JSON.parse(response.body)
    else
      @error = 'Failed to fetch data'
    end
  end
end
