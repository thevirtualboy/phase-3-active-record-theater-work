class AddFkeyAuditions < ActiveRecord::Migration[5.2]
  def change
    add_column :auditions, :role_id, :integer
  end
end
