class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
    	t.column :name, :text
    	t.column :number, :bigint
    	t.column :email, :text
    	t.column :account_balance, :bigint
    	t.column :user_id, :integer

        t.timestamps
    end
  end
end
