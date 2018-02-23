class AddUserRefToResources < ActiveRecord::Migration[5.1]
  def change
    add_reference :resources, :user, foreign_key: true
  end
end
