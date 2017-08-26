class ChangeColumnType < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :recording_type, :string
  end
end
