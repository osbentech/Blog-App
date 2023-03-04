class AddFieldsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :authorid, :bigint
    add_column :comments, :postid, :bigint
  end
end
