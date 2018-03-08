class CreateFileKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :file_keys do |t|
      t.string :file_key

      t.timestamps
    end
  end
end
