class MonstersController < ApplicationController

  def index
    render json: Monster.all
  end

  def create

  end

  def show
    render json: Monster.find(params[:id])
  end

  def update

  end

  def destroy

  end
end
