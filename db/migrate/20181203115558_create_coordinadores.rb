class CreateCoordinadores < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinadores do |t|
      t.string :nombre
      t.text :bio

      t.timestamps
    end
  end
end
