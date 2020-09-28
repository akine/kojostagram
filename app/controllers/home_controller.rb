class HomeController < ApplicationController
  def index
    uri = URI.parse("https://kojo-photo.microcms.io/api/v1/photo")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === "https"

    headers = { "X-API-KEY" => Rails.application.credentials.xapi[:key] }
    response = http.get(uri.path+"?limit=20", headers)
    @photos = JSON.parse(response.body)
  end
end
