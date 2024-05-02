class AddPlatformToMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_reference :microposts, :platform, null: false, foreign_key: true
  end
end
