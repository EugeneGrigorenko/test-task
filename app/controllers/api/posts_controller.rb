# frozen_string_literal: true

module Api
  class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
      posts = Post.page(params[:page])

      meta = { total_pages: posts.total_pages }
      render json: PostSerializer.new(posts, { meta: meta }).serialized_json
    end

    # private

    # def post_params
    #   require
    # end
  end
end
