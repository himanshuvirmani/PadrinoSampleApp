class Timezone
  include DataMapper::Resource
  storage_names[:default] = 'TIMEZONES'
  # property <name>, <type>
  property :timezone, String, :key => true, :lazy => false
  has n, :radio_timezones , :child_key => [:timezone]
  has n, :radios, :through => :radio_timezones, :child_key => [:frequency, :city]

end
