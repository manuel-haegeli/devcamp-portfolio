# frozen_string_literal: true

# Set the pages title
module PageDefaultsConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_defaults
  end

  def set_defaults
    @page_title = "Devcamp Portfolio | My Portfolio Website"
  end
end