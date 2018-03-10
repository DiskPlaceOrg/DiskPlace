class CreateResourcesFileKeysJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :resources_file_keys, id: false do |t|
    t.integer :resource_id
    t.integer :file_key_id
  end

    add_index :resources_file_keys, :resource_id
    add_index :resources_file_keys, :file_key_id
  end
end
