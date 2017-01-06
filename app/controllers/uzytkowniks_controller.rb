class UzytkowniksController < ApplicationController
  
  layout "admin"
  
  before_action :sprawdz_logowanie
  
  def index
    @uzytkownik = Uzytkownik.sortuj
  end

  def nowy
  end

  def edycja
  end

  def usun
  end
end
