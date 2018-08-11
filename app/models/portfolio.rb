# frozen_string_literal: true

# A highlighted past project
class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: ->(attributes) { attributes['name'].blank? }
  include Placeholder
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :main_image, :thumbnail_image

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image(width: 600, height: 400)
    self.thumbnail_image ||= Placeholder.image(width: 350, height: 200)
  end

  def self.angular
    where(subtitle: 'Angular')
  end
end
