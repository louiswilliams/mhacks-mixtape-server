class CodeController < ApplicationController
  def random
    render json: generate_code
  end
end
