class Encuentro < ApplicationRecord
  has_many :charlas
  has_many :exponentes

  has_many_attached :fotos

  def fotos_charlas
    ary = Array.new
    charlas.each do |c|
      c.fotos.each do |f|
        ary.push(f)
      end
    end
    ary
  end

  def fotos_ensayos
    ary = Array.new
    ensayos.each do |e|
      e.fotos.each do |f|
        ary.push(f)
      end
    end
    ary
  end

end
