class AddOutdoorColumn < ActiveRecord::Migration
  def change
    add_column :tracks, :outdoor, :boolean, null: false
  end
end
