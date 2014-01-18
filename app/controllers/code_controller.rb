class CodeController < ApplicationController
  def random
    render :json => RandomWord.nouns.next
  end
end
