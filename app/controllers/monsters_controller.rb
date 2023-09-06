class MonstersController < ApplicationController

  def index
    if params[:user_id].present?
      render json: Monster.where(user_id: params[:user_id]).merge(Monster.where(user_id: 1))
    else
      render json: Monster.where(user_id: 1)
    end
  end

  def create
    @monster = Monster.new(monster_params)
    render json: @monster if @monster.save
  end

  def show
    render json: Monster.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private

  def monster_params
    params.permit(
    %i[
    name
    user_id
    size
    monster_type
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
