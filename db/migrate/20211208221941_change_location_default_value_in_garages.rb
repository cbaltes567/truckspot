class ChangeLocationDefaultValueInGarages < ActiveRecord::Migration[6.0]
  def change
    change_column_default :garages, :location,
                          "2133 Sheridan Rd, Evanston, IL 60208"
  end
end
