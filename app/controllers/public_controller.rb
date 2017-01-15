class PublicController < ApplicationController
  
  layout 'public'
  
  def index
    @strona = Strona.where(:widoczna => true).last(3)
    @artykuly = Artykul.where(:widoczny => true).last(3)
    @galerie = Galerie.where(:widoczna => true).last(3)
  end

  def artykuly
  end

  def galerie
  end

  def kategorie
  end

  def nowosci
  end

  def strona
  end
end
