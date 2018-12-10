class AddCoordinadorToEncuentro < ActiveRecord::Migration[5.2]
  def change
    add_column :encuentros, :nombre_coordinador, :string
    add_column :encuentros, :bio_coordinador, :text
  end
end
