class StronasController < ApplicationController

  layout 'admin'

  def index
    @stronas = Strona.sortuj
  end

  def pokaz
  end

  def nowa
  end

  def edycja
  end

  def usun
  end
end
