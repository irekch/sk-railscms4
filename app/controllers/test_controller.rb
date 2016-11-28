class TestController < ApplicationController
  layout false
  def index
    # to jest testowe odwolanie do pliku index.html.erb
    @testowa = "Witam w kursie ROR"
    @imiona = ['ala', "ewa", "ola"]
  end
  def test
    render ('witaj')
  end
  def kurs
    redirect_to('http://www.strefakursow.pl')
  end
end