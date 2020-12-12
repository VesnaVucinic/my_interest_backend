class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :boards
  # has_many :boards, serializer: BoardSerializer
end
