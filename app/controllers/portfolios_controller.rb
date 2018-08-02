class PortfoliosController < ApplicationController
  def index
    @portfilio_items = Portfolio.all
  end
end
