# frozen_string_literal: true

# A highlighted past project
class Portfolio < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
end
