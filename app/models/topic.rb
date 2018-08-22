# frozen_string_literal: true

# Topic to group similar blog posts
class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :blogs

  scope :with_blogs, -> { includes(:blogs).where(blogs: { status: 1 }) }
end
