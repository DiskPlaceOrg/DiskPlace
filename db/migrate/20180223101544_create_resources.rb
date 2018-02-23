class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :file_name
      t.string :file_type
      t.integer :file_size
      t.string :file_path

      t.timestamps
    end
  end
end
