class CreateResourcesFileKeysJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :resources_file_keys, id: false do |t|
    t.integer :resources_id
    t.integer :file_keys_id
  end

    add_index :resources_file_keys, :resources_id
    add_index :resources_file_keys, :file_keys_id
  end
end
