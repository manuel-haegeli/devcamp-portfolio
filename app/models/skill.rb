# frozen_string_literal: true

# A skill eg. C# programming, Testautomation
class Skill < ApplicationRecord
  validates_presence_of :title, :percent_utilized
end
