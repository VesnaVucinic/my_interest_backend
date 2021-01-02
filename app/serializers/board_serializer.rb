class BoardSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url, :likes, :user_id, :user
end
