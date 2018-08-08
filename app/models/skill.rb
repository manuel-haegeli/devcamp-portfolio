# frozen_string_literal: true

# A skill eg. C# programming, Testautomation
class Skill < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :percent_utilized

  after_initialize :set_defaults

  def set_defaults
    self.badge ||= Placeholder.image(width: 250, height: 250)
  end
end
