# frozen_string_literal: true

# A highlighted past project
class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: ->(attributes) { attributes['name'].blank? }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  mount_uploader :main_image, PortfolioUploader
  mount_uploader :thumbnail_image, PortfolioUploader

  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order('position ASC')
  end
end
