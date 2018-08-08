# frozen_string_literal: true

# A highlighted past project
class Portfolio < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :main_image, :thumbnail_image
end
