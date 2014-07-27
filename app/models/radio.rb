class Radio
  include DataMapper::Resource
  storage_names[:default] = 'RADIO_INFO'
  # property <name>, <type>
  property :frequency, String, :key => true
  property :city_name, String,:field => "city", :key => true
  property :url, String
  property :port, String
  property :title, String
  property :image_url, String
  property :category, String
  property :description, String
  property :lastUpdated, Time, :field => "lastUpdated"
  has n, :radio_timezones, :child_key => [:frequency, :city, :timezone]
  has n, :timezones, :through => :radio_timezones, :child_key => [:timezone]



  def to_json *a
       puts "XXX super Called #{a} #{frequency} , #{city_name}"
       hash = {:methods => [:timezones], :exclude => [:city]}.merge(a.first)
       puts "XXX hash value #{hash[:methods]}"
       #return (Radio.all(:frequency => frequency)).to_json
       return super(hash)
       #super.to_json *a
       # as_json.to_json *a
  end

end
