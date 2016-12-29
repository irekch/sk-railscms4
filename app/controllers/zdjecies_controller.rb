class ZdjeciesController < ApplicationController
  
  layout 'admin'
  
  def index
    @zdjecia = Zdjecie.sortuj
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
