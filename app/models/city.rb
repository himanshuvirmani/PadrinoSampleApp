class City
  include DataMapper::Resource
  storage_names[:default] = 'CITIES'
  # property <name>, <type>
  property :city, String, :key => true
  has n, :radios, :child_key => [:city]
end
