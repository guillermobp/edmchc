class Coordinador < ApplicationRecord
    self.table_name = 'coordinadores'

    has_one_attached :foto
end
