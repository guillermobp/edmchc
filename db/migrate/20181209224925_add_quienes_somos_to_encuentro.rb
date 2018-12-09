class AddQuienesSomosToEncuentro < ActiveRecord::Migration[5.2]
  def change
    add_column :encuentros, :titulo_quienes_somos, :string
    add_column :encuentros, :cuerpo_quienes_somos, :text
  end
end
