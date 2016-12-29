class ZdjeciesController < ApplicationController
  
  layout 'admin'
  
  def index
    @zdjecia = Zdjecie.sortuj
  end

  def nowe
    @zdjecia = Zdjecie.new({:nazwa => "Wprowadź tytuł zdjęcia"})
    @licznik = Zdjecie.count + 1
    @galeria = Galerie.order('pozycja ASC')
  end

  def utworz
    @zdjecia = Zdjecie.new(zdjecia_parametry)
    if @zdjecia.save
      flash[:notice] = "Zdjęcie zostało pomyślnie zapisane"
      redirect_to(:action => 'index')
    else
      @licznik = Zdjecie.count + 1
      @galeria = Galerie.order('pozycja ASC')
      render('nowe')
    end
  end

  def pokaz
  end

  def edycja
  end

  def usun
  end
  
  def zdjecia_parametry
    params.require(:zdjecia).permit(:galerie_id, :nazwa, :pozycja, :widoczne, :created_at, :opis, :zdjecie)
  end
  
end
