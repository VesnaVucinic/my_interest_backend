class AddLikesToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :likes, :integer
  end
end
