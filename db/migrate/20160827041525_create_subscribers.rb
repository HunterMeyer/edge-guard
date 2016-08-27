class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.text :type
      t.text :first_name
      t.text :last_name
      t.text :email
      t.text :phone
      t.text :region
      t.text :country
      t.text :gamer_tag
      t.text :gamer_prefix
      t.text :sponsors_name
      t.text :payment_status
      t.text :customer_token
      t.boolean :sponsored
    end

    add_index :subscribers, :type
    add_index :subscribers, :customer_token
  end
end
