class Spotify < ApplicationController

    class << self
        def search query
            url = URI("http://ws.spotify.com/search/1/track.json?q=#{query}")
            response = Net::HTTP.get_response(url)
            return JSON(response.body)
        end
    end
end