class Artykul < ActiveRecord::Base
  belongs_to :strona

  # przekopiowane z paperclip dla Rails 4
  # has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # zmienione dla naszego programu
  has_attached_file :zdjecie, :styles => { :medium => "600x600>", :thumb => "200x200>" }

  validates_attachment_content_type :zdjecie, 
                                    :content_type => /^image\/(png|gif|jpeg)/,
                                    :message => '--- akceptuję tylkopliki GIF JPG i PNG ---'

  validates_attachment_size :zdjecie, 
                                    :in => 0..850.kilobytes,
                                    :message => '--- za duży plik max rozmiar to 850kB---'
                                    
  validates :nazwa,
            :presence => true,
            :length => { :maximum => 120, :message => ": Za długi tytuł artykułu. Maximum 120 znaków"}

  scope :widoczny, lambda{where(:widoczny => true)}
  scope :niewidoczny, lambda{where(:widoczny => false)}
  scope :sortuj, lambda{order("artykuls.pozycja ASC")}
  scope :najnowszy, lambda{order("artykuls.created_at DESC")}  

end
