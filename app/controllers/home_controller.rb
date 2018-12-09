class HomeController < ApplicationController
  def index
    @encuentro = Encuentro.last
  end
end
