# frozen_string_literal: true

class Post < ApplicationRecord
  paginates_per 5

  belongs_to :author, class_name: 'User'
  has_many :reactions, class_name: 'UserPostReaction'

  def liked_by?(user_id)
    # use array here, assuming, include was used, so data is not requested for each record

    # if the application grows significantly and there are hundreds of thousends
    # likes per post it might make sense to make n+1 here for every page
    # instead of loading all of these reactions in memory
    reactions.any? do |user_post_record|
      user_post_record.user_id == user_id && user_post_record.reaction == UserPostReaction::LIKED
    end
  end

  def likes_count
    reactions.count { |user_post| user_post.reaction == UserPostReaction::LIKED }
  end
end
