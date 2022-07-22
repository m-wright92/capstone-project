class CreatePostReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :post_reactions do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :post, index: true, foreign_key: true
      t.string :reaction_type

      t.timestamps
    end
  end
end
