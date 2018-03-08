class RenameresourcesFileKeysTofileKeysResources < ActiveRecord::Migration[5.1]
  def change
    rename_table :resources_file_keys, :file_keys_resources
  end
end
