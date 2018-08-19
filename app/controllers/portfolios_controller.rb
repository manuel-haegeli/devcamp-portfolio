# frozen_string_literal: true

# Portfolios describes highlighted past projects
class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[show edit update destroy]
  layout 'portfolio'
  access all: %i[show index], user: { except: %i[destroy new create update edit sort] }, site_admin: :all

  def index
    @portfilio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update!(position: value[:position])
    end

    head :ok, content_type: 'text/html'
  end

  def new
    @portfilio_item = Portfolio.new
    3.times { @portfilio_item.technologies.build }
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
        format.json { render :index, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @portfilio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfilio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @portfilio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_portfolio
    @portfilio_item = Portfolio.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    raise ActionController::RoutingError, 'Not Found'
  end

  def portfolio_params
    params.require(:portfolio).permit(
      :title,
      :subtitle,
      :body,
      technologies_attributes: [:name]
    )
  end
end
