class AddHeaderDataToEncuentros < ActiveRecord::Migration[5.2]
  def change
    add_column :encuentros, :epigrafe, :string
    add_column :encuentros, :titulo, :string
    add_column :encuentros, :bajada, :string
  end
end
