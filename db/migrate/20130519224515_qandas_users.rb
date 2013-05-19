class QandasUsers < ActiveRecord::Migration
  create_table :qandas_users, :id => false do |t|
    t.references :qanda, :null => false
    t.references :user, :null => false
  end

  def down
  end
end
