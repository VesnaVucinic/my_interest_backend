class AddImageUrlToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :image_url, :string
  end
end
