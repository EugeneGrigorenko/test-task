# frozen_string_literal: true

class UserPostReactionsService
  def initialize(user, post, reaction)
    @user = user
    @post = post
    @reaction = if reaction == 'like'
                  1
                elsif reaction == 'dislike'
                  -1
                end

    raise 'Invalid reaction' unless @reaction
  end

  def call
    user_post = UserPostReaction.where(user: @user, post: @post).first_or_initialize
    user_post.reaction = @reaction

    user_post.save!
  end
end
