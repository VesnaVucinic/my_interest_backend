class PinSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :image_url, :user_id, :board_id :user :board
end
