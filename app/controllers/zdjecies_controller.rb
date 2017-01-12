class ZdjeciesController < ApplicationController
  
  layout 'admin'
  
  before_action :sprawdz_logowanie
  before_action :szukaj_galerie
  
  def index
    @zdjecia = @galerie.zdjecies.sortuj
  end

  def nowe
    @zdjecia = Zdjecie.new({:galerie_id => @galerie.id, :nazwa => "Wprowadź tytuł zdjęcia"})
    @licznik = Zdjecie.count + 1
    @galeria = Galerie.order('pozycja ASC')
  end

  def utworz
    @zdjecia = Zdjecie.new(zdjecia_parametry)
    if @zdjecia.save
      flash[:notice] = "Zdjęcie zostało pomyślnie zapisane"
      redirect_to(:action => 'index', :galerie_id => @galerie.id)
    else
      @licznik = Zdjecie.count + 1
      @galeria = Galerie.order('pozycja ASC')
      render('nowe')
    end
  end

  def pokaz
    @zdjecia = Zdjecie.find(params[:id])
  end

  def edycja
    @zdjecia = Zdjecie.find(params[:id])
    @licznik = Zdjecie.count
    @galeria = Galerie.order('pozycja ASC')
  end
  
  def aktualizuj
    @zdjecia = Zdjecie.find(params[:id])
    if @zdjecia.update_attributes(zdjecia_parametry)
      flash[:notice] = "Zdjęcie zostało zmodyfikowane"
      redirect_to(:action => 'pokaz', :id => @zdjecia.id, :galerie_id => @galerie.id)
    else
      @licznik = Zdjecie.count
      @galeria = Galerie.order('pozycja ASC')
      render('edycja')
    end
  end

  def usun
    @zdjecia = Zdjecie.find(params[:id])
  end
  
  def kasuj
    zdjecia = Zdjecie.find(params[:id]).destroy
    flash[:notice] = "Zdjęcie '#{zdjecia.nazwa}' zostało skasowane"
    redirect_to(:action => 'index', :galerie_id => @galerie.id)
  end

private
  
  def zdjecia_parametry
    params.require(:zdjecia).permit(:galerie_id, :nazwa, :pozycja, :widoczne, :created_at, :opis, :zdjecie)
  end

  def szukaj_galerie
    if params[:galerie_id]
      @galerie = Galerie.find(params[:galerie_id])
    end
  end
  
end
