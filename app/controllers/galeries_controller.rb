class GaleriesController < ApplicationController
  
  layout 'admin'
  
  def index
    @galeria = Galerie.sortuj
  end

  def nowa
  end

  def pokaz
  end

  def edycja
  end

  def usun
  end
end
