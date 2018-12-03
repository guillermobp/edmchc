class CreateConciertos < ActiveRecord::Migration[5.2]
  def change
    create_table :conciertos do |t|
      t.date :fecha
      t.time :hora
      t.text :lugar
      t.text :obras
      t.text :interpretes
      t.references :encuentro, foreign_key: true

      t.timestamps
    end
  end
end
