class AddFieldsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :authorid, :bigint
  end
end
