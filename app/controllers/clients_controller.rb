class ClientsController < ApplicationController
  def index
    @clients = Client.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @clients.map(&:name)
  end
end
