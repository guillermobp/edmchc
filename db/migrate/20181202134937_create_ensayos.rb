class CreateEnsayos < ActiveRecord::Migration[5.2]
  def change
    create_table :ensayos do |t|
      t.string :titulo
      t.text :descripcion
      t.references :encuentro, foreign_key: true

      t.timestamps
    end
  end
end
