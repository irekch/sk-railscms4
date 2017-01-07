class Uzytkownik < ActiveRecord::Base
  has_secure_password
  
	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :imie,
            :presence => {:in => true, :message => ":pole nie może być puste"}
            
  validates :nazwisko,
            :presence => {:in => true, :message => ":pole nie może być puste"}
            
  validates :uzytkownik,
            :length => {:within => 4..25, :message => ":nazwa użytkownika musi się zawierać między 4 a 25 znaków"},
            :uniqueness => true

  validates :email,
            :presence => true,
            :length => {:maximum => 100},
            :format => {:with => EMAIL_REGEX, :message => ":niepoprawny format"},
            :confirmation => true
            
  scope :sortuj, lambda{order("nazwisko ASC, imie ASC")}

end