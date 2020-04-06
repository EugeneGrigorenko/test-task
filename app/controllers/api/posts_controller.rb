# frozen_string_literal: true

module Api
  class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
      posts = Post.include(:reactions).page(params[:page])

      meta = { total_pages: posts.total_pages }
      render json: PostSerializer.new(posts, { meta: meta }).serialized_json
    end

    def react
      post = Post.find_by(id: params[:id])

      unless post
        render(json: { error: 'Post not found' }, status: 404) && return
      end

      UserPostReactionsService.new(current_user, post, params[:reaction]).call

      render json: PostSerializer.new(post).serialized_json
    end
  end
end
