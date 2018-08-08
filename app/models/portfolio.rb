# frozen_string_literal: true

# A highlighted past project
class Portfolio < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :main_image, :thumbnail_image

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= 'http://via.placeholder.com/600x400'
    self.thumbnail_image ||= 'http://via.placeholder.com/350x200'
  end
end
