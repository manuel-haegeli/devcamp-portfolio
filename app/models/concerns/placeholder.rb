# frozen_string_literal: true

# Concern to create a placeholder image
module Placeholder
  extend ActiveSupport::Concern

  def self.image(width:, height:)
    "http://via.placeholder.com/#{width}x#{height}"
  end
end