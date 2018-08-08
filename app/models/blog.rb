# frozen_string_literal: true

# A blog post
class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
end
