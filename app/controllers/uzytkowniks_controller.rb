class UzytkowniksController < ApplicationController
  
  layout "admin"
  
  before_action :sprawdz_logowanie
  
  def index
    @uzytkownik = Uzytkownik.sortuj
  end

  def nowy
    @uzytkownik = Uzytkownik.new
  end

  def utworz
    @uzytkownik = Uzytkownik.new(uzytkownik_parametry)
    if @uzytkownik.save
      flash[:notice] = "Użytkownik został pomyślnie dodany"
      redirect_to(:action=>'index')
    else
      @licznik = Uzytkownik.count + 1
      render('nowy')
    end
  end

  def edycja
  end

  def usun
  end
  
  private
  
  def uzytkownik_parametry
    params.require(:uzytkownik).permit(:imie, :nazwisko, :uzytkownik, :email, :password, :password_confirmation)
  end
  
end
