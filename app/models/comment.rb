# frozen_string_literal: true

# Blog comment
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { minimum: 5, maximum: 300 }

  after_create_commit { CommentBroadcastJob.perform_later(self) }
end
