# frozen_string_literal: true

class Post < ApplicationRecord
  paginates_per 5

  belongs_to :author, class_name: 'User'
  has_many :reactions, class_name: 'UserPostReaction'

  validates :title, presence: true

  def liked_by?(user_id)
    reactions.exists?(user_id: user_id, reaction: UserPostReaction::LIKED)
  end

  def likes_count
    reactions.where(reaction: UserPostReaction::LIKED).count
  end
end
