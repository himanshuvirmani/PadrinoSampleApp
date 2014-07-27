migration 2, :create_cities do
  up do
    create_table :cities do
      column :id, Integer, :serial => true
      
    end
  end

  down do
    drop_table :cities
  end
end
