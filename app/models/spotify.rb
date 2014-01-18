class Spotify < ApplicationController

    class << self
        def search query
            url = URI("http://ws.spotify.com/search/1/track.json?q=#{query}")
            response = Net::HTTP.get_response(url)
            if response.code == 200
                return JSON(response.body)
            else
                return false
            end
        end

        def lookup track_url
            url = URI("http://ws.spotify.com/lookup/1/.json?uri=#{track_url}")
            response = Net::HTTP.get_response(url)
            if response.code == 200
                return JSON(response.body)
            else
                return false
            end 
        end
    end
end