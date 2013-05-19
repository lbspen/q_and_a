class AddCreatedByToQanda < ActiveRecord::Migration
  def change
    add_column :qandas, :created_by, :integer
    add_index :qandas, :created_by
  end
end
