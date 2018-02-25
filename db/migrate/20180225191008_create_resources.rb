class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|

      t.timestamps
    end
  end
end
