# frozen_string_literal: true

class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :body, :created_at

  belongs_to :author

  attribute :liked_by_current_user do |post, params|
    current_user_id = params[:current_user]&.id
    next unless current_user_id

    post.liked_by?(current_user_id)
  end

  attribute :likes_count
end
