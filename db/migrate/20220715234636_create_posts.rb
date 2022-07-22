class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :post_body
      t.timestamps
    end
  end
end
