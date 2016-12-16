class Artykul < ActiveRecord::Base
  belongs_to :strona

  scope :widoczny, lambda{where(:widoczny => true)}
  scope :niewidoczny, lambda{where(:widoczny => false)}
  scope :sortuj, lambda{order("artykuls.pozycja ASC")}
  scope :najnowszy, lambda{order("artykuls.created_at DESC")}  

end
