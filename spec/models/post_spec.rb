require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  it 'should not be liked by if there is no reaction' do
    expect(post.liked_by?(user.id)).to be false
  end

  it 'should be liked by if there is correct reaction' do
    reaction = UserPostReaction.create!(post: post, user: user, reaction: 1)
    expect(post.liked_by?(user.id)).to be true
  end

  it 'should not be liked by if there is incorrect reaction' do
    reaction = UserPostReaction.create!(post: post, user: user, reaction: -1)
    expect(post.liked_by?(user.id)).to be false
  end

  context 'likes count' do
    it 'should be zero without reactions' do
      expect(post.likes_count).to eq 0
    end

    it 'should count likes and skip dislikes' do
      UserPostReaction.create!(post: post, user: user, reaction: -1)
      UserPostReaction.create!(post: post, user: user, reaction: 1)
      UserPostReaction.create!(post: post, user: user, reaction: 1)

      expect(post.likes_count).to eq 2
    end
  end
end
