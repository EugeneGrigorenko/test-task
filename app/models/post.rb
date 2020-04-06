# frozen_string_literal: true

class Post < ApplicationRecord
  paginates_per 5

  belongs_to :author, class_name: 'User'
end
