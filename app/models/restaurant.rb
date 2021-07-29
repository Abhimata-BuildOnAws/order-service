# frozen_string_literal: true

class Restaurant < ApplicationRecord
  # attr_accessor :id, :name, :street, :state, :country, :contact_no, :stripe_id, :latitude, :longitude

  # Relationships
  has_many :orders
  has_many :hitches

  geocoded_by :address

  # Relationships
  has_many :menu_items

  # Validations
  validates_uniqueness_of :name, scope: %i[street], message: 'This restaurant is already listed under the same address'

  after_validation :geocode

  def address
    if state == country
      [street, country].compact.join(', ')
    else
      [street, state, country].compact.join(', ')
    end
  end

  def ors_coordinates
    [longitude, latitude]
  end
end
