# frozen_string_literal: true

# A blog post
class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  enum status: { draft: 0, published: 1 }
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :body

  scope :recent, -> { order(created_at: :desc) }

  belongs_to :topic, optional: true
end
