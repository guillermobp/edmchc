class AddCoordinadorToEncuentro < ActiveRecord::Migration[5.2]
  def change
    add_reference :encuentros, :coordinador, foreign_key: { to_table: :coordinadores }
  end
end
