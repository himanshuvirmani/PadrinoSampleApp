migration 4, :create_radio_timezones do
  up do
    create_table :radio_timezones do
      column :id, Integer, :serial => true
      
    end
  end

  down do
    drop_table :radio_timezones
  end
end
