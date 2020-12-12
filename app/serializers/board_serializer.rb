class BoardSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url, :user_id
end
