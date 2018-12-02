class Ensayo < ApplicationRecord
  belongs_to :encuentro

  has_many_attached :fotos
end
