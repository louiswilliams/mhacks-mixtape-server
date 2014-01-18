class CodeController < ApplicationController
  def random
    begin
        word = RandomWord.nouns.next
        matches = /^[a-z]{5,12}$/ =~ word
        exists = Playlist.find_by_code word
    end until  matches && !exists
    render json: word
  end
end
