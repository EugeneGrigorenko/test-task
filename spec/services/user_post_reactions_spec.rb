require 'rails_helper'

RSpec.describe UserPostReactionsService do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  it 'should save user post reaction successfully' do
    response = nil
    expect {
      response = UserPostReactionsService.new(user, post, 'like').call
    }.to change { UserPostReaction.count }.from(0).to(1)

    expect(response).to be true
  end

  it 'should change reaction on existing user_post' do
    user_post_reaction = UserPostReaction.create!(user: user, post: post, reaction: 1)
    expect {
      UserPostReactionsService.new(user, post, 'dislike').call
    }.not_to change { UserPostReaction.count }

    expect(user_post_reaction.reload.reaction).to eq(-1)
  end

  it 'should raise if reaction is not supported' do
    expect {
      response = UserPostReactionsService.new(user, post, 'wrong_reaction').call
    }.to raise_exception('Invalid reaction')
  end
end
