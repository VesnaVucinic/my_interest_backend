class BoardSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :user_id, :user
end
