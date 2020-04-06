require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before do
    @user = create(:user)
    allow_any_instance_of(Api::PostsController).to receive(:current_user).and_return(@user)
  end

  context 'index' do
    it 'should authenticate user and respond with json' do
      expect_any_instance_of(Api::PostsController).to receive(:authenticate_user!).exactly(:once)

      get '/api/posts'
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it 'renders list of posts' do
      create(:post)
      create(:post)

      get '/api/posts'

      body = JSON.parse(response.body)
      pages_count = body.dig('meta', 'total_pages')
      posts_count = body['data'].size

      expect(pages_count).to eq(1)
      expect(posts_count).to eq(2)
    end
  end

  context 'reactions' do
    let!(:post) { create(:post) }

    it 'should authenticate user and respond with json' do
      expect_any_instance_of(Api::PostsController).to receive(:authenticate_user!).exactly(:once)

      put react_api_post_path(post), { params: { reaction: :like }}
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it 'should return an error if the post is not found' do
      put react_api_post_path(0), { params: { reaction: :like }}

      expect(response.status).to eq(404)
      expect(response.body).to include('Post not found')
    end
  end
end
