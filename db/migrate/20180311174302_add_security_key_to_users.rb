class AddSecurityKeyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :security_key, :string
  end
end
