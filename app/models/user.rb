class User
  include DataMapper::Resource
  storage_names[:default] = 'USER_DETAILS'
  # property <name>, <type>
  property :uuid, String, :key => true
  property :email, String
  property :source, String
end
