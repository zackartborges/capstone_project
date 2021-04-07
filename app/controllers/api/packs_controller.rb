class Api::PacksController < ApplicationController
  def index
    @packs = Pack.all
    render "index.json.jb"
  end

  def show
    @input = params[:id]
    @pack = Pack.find(@input)
    render "show.json.jb"
  end

  def create
    @pack = Pack.new(
      user_id: params[:user_id],
      gear_id: params[:gear_id],
    )
  end

  def update
    @pack = Pack.find_by(id: params [:id])
    @pack.user_id = params[:user_id] || @pack.user_id
    @pack.gear_id = params[:gear_id] || @pack.gear_id
  end

  def destroy
    input = params[:id]
    @pack = Pack.find(input)
    @pack.delete
    render json: { message: "pack association deleted"}
  end
end
