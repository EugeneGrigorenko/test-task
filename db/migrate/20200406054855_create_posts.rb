# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body
      t.references :author, null: false, references: :users

      t.timestamps
    end
    add_foreign_key :posts, :users, column: :author_id
  end
end
