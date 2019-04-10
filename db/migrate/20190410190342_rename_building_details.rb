class RenameBuildingDetails < ActiveRecord::Migration[5.2]
    def self.up
      rename_table :building_details, :buildingdetails
    end
  
    def self.down
      rename_table :buildingdetails, :building_details
    end
  end

