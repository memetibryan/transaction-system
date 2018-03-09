class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
    	t.column :sender, :text
    	t.column :recepient, :text
    	t.column :reference_number, :text
    	t.column :user_id, :integer

        t.timestamps
    end
  end
end
