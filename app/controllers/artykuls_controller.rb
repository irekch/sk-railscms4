class ArtykulsController < ApplicationController
  
  layout 'admin'

  def index
     @artykuly = Artykul.sortuj
  end

  def pokaz
    @artykuly = Artykul.find(params[:id])
  end

  def nowy
    @artykuly = Artykul.new({:nazwa => "Wprowadź tytuł artykułu"})
    @strona = Strona.order('pozycja ASC')
    @licznik = Artykul.count + 1
  end
  
  def utworz
    @artykuly = Artykul.new(artykuly_parametry)
    if @artykuly.save
      flash[:notice] = "Artykuł został pomyślnie utworzony"
      redirect_to(:action=>'index')
    else
      @licznik = Artykul.count + 1
      @strona = Strona.order('pozycja ASC')
      render('nowy')
    end
  end

  def edycja
  end

  def usun
  end
  
  def artykuly_parametry
    params.require(:artykuly).permit(:nazwa, :pozycja, :widoczny, :created_at, :strona_id, :zdjecie)
  end
  
end
