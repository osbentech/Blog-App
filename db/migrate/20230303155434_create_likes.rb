class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.bigint :authorid
      t.bigint :postid

      t.timestamps
    end
  end
end
