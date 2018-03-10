class CreateMpesas < ActiveRecord::Migration[5.1]
  def change
    create_table :mpesas do |t|
    	t.column :access_token, :text
    	t.column :customer_paybill, :text
    	t.column :amount, :bigint
    	t.column :bill_refnumber, :text

      t.timestamps
    end
  end
end
