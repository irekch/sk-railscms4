class KategoriesController < ApplicationController
  
  layout false
  
  def index
    @kategorie = Kategorie.sortuj
  end

  def pokaz
    @kategoria = Kategorie.find(params[:id])
  end

  def nowa
    @kategoria = Kategorie.new({:nazwa => "Podaj nazwę kategorii"})
    @licznik = Kategorie.count + 1
  end
  
  def utworz
    @kategorie = Kategorie.new(kategorie_parametry)
    if @kategorie.save
      redirect_to(:action=>'index')
    else
      @licznik = Kategorie.count + 1
      render('nowa')
    end
  end

  def edycja
  end

  def usun
  end
  
  def kategorie_parametry
    params.require(:kategoria).permit(:nazwa, :pozycja, :widoczna)
  end

end
