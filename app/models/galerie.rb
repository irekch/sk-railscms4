class Galerie < ActiveRecord::Base
  has_many :zdjecies
  
  scope :widoczna, lambda{where(:widoczny => true)}
  scope :niewidoczna, lambda{where(:widoczny => false)}
  scope :sortuj, lambda{order("galeries.pozycja ASC")}
  scope :najnowsza, lambda{order("galeries.created_at DESC")}  

end
