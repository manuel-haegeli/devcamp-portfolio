# frozen_string_literal: true

# Set the referral link the user came from
module SocialmediaReferral
  extend ActiveSupport::Concern

  included do
    before_action :set_referral
  end

  def set_referral
    session[:referral] = params[:r] if params[:r]
  end
end