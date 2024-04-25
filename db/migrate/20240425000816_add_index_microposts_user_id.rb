class AddIndexMicropostsUserId < ActiveRecord::Migration[7.0]
  add_index :microposts, :user_id
end
