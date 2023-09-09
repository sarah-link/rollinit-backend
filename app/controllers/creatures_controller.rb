# frozen_string_literal: true

class CreaturesController < ApplicationController
  before_action :lookup_creature, only: %i[update show destroy]
  before_action :lookup_user, only: %i[index update create]

  def index
    render json: @user.creatures + Creature.where(base_creature: true)
  end

  def create
    @creature = @user.creatures.create(creature_params)
    render json: @creature if @creature.save
  end

  def show
    render json: @creature
  end

  # TODO: authorize user
  def update
    if @creature.base_creature
      render json: 'Cannot update base creature', status: 405
    elsif @creature.update(creature_params)
      render json: @creature
    end
  end

  # TODO: authorize user
  def destroy
    if @creature.base_creature
      render json: 'Cannot delete base creature', status: 405
    elsif @creature.destroy
      render json: @creature
    end
  end

  private

  def lookup_creature
    @creature = Creature.find(params[:id])
  end

  # TODO: proper authentication
  def lookup_user
    @user = User.find(params[:user_id])
  end

  def creature_params # rubocop:disable Metrics/MethodLength
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
        reactions
      ]
    )
  end
end
