# frozen_string_literal: true

class Creature < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
end
