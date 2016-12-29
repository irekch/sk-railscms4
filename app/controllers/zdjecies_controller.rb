class ZdjeciesController < ApplicationController
  
  layout 'admin'
  
  def index
    @zdjecia = Zdjecie.sortuj
  end

  def nowe

  end

  def pokaz
  end

  def edycja
  end

  def usun
  end
  
  def zdjecia_parametry
    params.require(:zdjecia).permit(:nazwa, :pozycja, :widoczne, :created_at, :opis, :zdjecie)
  end
  
end
