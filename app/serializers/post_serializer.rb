# frozen_string_literal: true

class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :body, :created_at

  belongs_to :author, record_type: :user
end
