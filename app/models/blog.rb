# frozen_string_literal: true

# A blog post
class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  enum status: { draft: 0, published: 1 }
end
