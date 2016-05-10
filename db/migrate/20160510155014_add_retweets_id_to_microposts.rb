class AddRetweetsIdToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :retweets_id, :integer
  end
end
