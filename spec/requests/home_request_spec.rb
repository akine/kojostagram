require 'rails_helper'

RSpec.describe "Homes", type: :request do
  it "get photos" do
    uri = URI.parse("https://kojo-photo.microcms.io/api/v1/photo")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === "https"

    headers = { "X-API-KEY" => Rails.application.credentials.xapi[:key] }
    response = http.get(uri.path+"?limit=20", headers)
    expect(response.code).to eq("200")
  end
end
