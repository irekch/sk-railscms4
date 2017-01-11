class Galerie < ActiveRecord::Base

  has_many :zdjecies, class_name: "Zdjecie"
  
  # przekopiowane z paperclip dla Rails 4
  # has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # zmienione dla naszego programu
  has_attached_file :zdjecie, :styles => { :medium => "600x600>", :thumb => "200x200>" }

  validates_attachment_content_type :zdjecie, 
                                    :content_type => /^image\/(png|gif|jpeg)/,
                                    :message => '--- akceptuję tylko pliki GIF JPG i PNG ---'

  validates_attachment_size :zdjecie, 
                                    :in => 0..850.kilobytes,
                                    :message => '--- za duży plik max rozmiar to 850kB---'
                                    
  validates :nazwa,
            :presence => true,
            :length => { :maximum => 120, :message => ": Za długa nazwa Galerii. Maximum 120 znaków"}
  
  scope :widoczna, lambda{where(:widoczny => true)}
  scope :niewidoczna, lambda{where(:widoczny => false)}
  scope :sortuj, lambda{order("galeries.pozycja ASC")}
  scope :najnowsza, lambda{order("galeries.created_at DESC")}  

end
