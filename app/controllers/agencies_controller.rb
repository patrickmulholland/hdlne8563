class AgenciesController < ApplicationController
  def index
    @agencies = Agency.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @agencies.map(&:name)
  end
end
