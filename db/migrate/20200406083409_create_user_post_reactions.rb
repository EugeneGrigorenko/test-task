# frozen_string_literal: true

class CreateUserPostReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_post_reactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.integer :reaction, null: false, limit: 1

      t.timestamps
    end
  end
end
