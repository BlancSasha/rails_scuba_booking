class ChangeTeacherAsFalseByDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :teacher, :boolean, default: false
  end
end
