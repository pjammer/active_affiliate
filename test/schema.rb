ActiveRecord::Schema.define(:version => 0) do
  create_table :affiliates, :force => true do |t|
    t.string :paypal_email
    t.integer :user_id
  end
end