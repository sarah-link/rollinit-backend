class CreaturesController < ApplicationController
  before_action :lookup_creature, only: %i[update show destroy]

  #TODO: check that user_id is the logged in user
  def index
    if params[:user_id].present?
      render json: Creature.where(user_id: params[:user_id]).merge(Creature.where(user_id: 1))
    else
      render json: Creature.where(user_id: 1)
    end
  end

  def create
    @creature = Creature.new(creature_params)
    render json: @creature if @creature.save
  end

  def show
    render json: Creature.find(params[:id])
  end

  def update
      render json: @creature if @creature.update(creature_params)
  end

  def destroy
    render json: @creature if @creature.destroy
  end

  private

  def lookup_creature
    @creature = Creature.find(params[:id])
  end

  def creature_params
    params.permit(
    %i[
    name
    user_id
    size
    creature_type
    alignment
    armor_class
    hit_points speed
    str
    str_mod
    dex
    dex_mod
    con
    con_mod
    int
    int_mod
    wis
    wis_mod
    cha
    cha_mod
    saving_throws
    skills
    senses
    languages
    cr
    traits
    actions
    legendary_actions
    damage_immunities
    condition_immunities
    damage_resistances
    damage_vulnerabilities
    reactions]
    )
  end
end
