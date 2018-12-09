require 'aws-sdk-s3'

class HomeController < ApplicationController
  def index
    @encuentro = Encuentro.last
  end
end
