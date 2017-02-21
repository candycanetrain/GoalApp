class AddPrivateToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :privacy, :string, default: "private"
  end
end
