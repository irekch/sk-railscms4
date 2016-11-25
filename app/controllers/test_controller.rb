class TestController < ApplicationController
  layout false
  def index
    # to jest testowe odwolanie do pliku index.html.erb
    @testowa = "Witam w kursie ROR"
  end
end
