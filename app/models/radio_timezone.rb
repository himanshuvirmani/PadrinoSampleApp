class RadioTimezone
  include DataMapper::Resource
  storage_names[:default] = 'RADIO_INFO_TIMEZONES'
  # property <name>, <type>
  property :frequency, String , :key => true, :field => "frequency"
  property :city, String , :key => true, :field => "city"
  property :timezone, String , :key => true, :field => "timezone"
  belongs_to :radio,   :child_key => [:frequency, :city]
  belongs_to :timezone,  :child_key => [:timezone]
end
