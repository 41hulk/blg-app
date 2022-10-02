class CreateChangeCountersToZeros < ActiveRecord::Migration[7.0]
  def change
    create_table :change_counters_to_zeros do |t|
      change_column_default(:posts, :comments_counter, from: nil, to: 0)
      change_column_default(:posts, :likes_counter, from: nil, to: 0)
      change_column_default(:users, :posts_counter, from: nil, to: 0)
      t.timestamps
    end
  end
end
