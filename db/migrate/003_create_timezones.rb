migration 3, :create_timezones do
  up do
    create_table :timezones do
      column :id, Integer, :serial => true
      
    end
  end

  down do
    drop_table :timezones
  end
end
