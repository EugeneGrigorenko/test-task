# frozen_string_literal: true

class UserPostReactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :reaction
end
