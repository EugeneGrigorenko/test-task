# frozen_string_literal: true

class UserPostReaction < ApplicationRecord
  belongs_to :user
  belongs_to :post

  LIKED = 1
  DISLIKED = -1
end
