migration 1, :create_radios do
  up do
    create_table :radios do
      column :id, Integer, :serial => true
      
    end
  end

  down do
    drop_table :radios
  end
end
