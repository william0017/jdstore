class AddImgToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :picture, :string
  end
end
