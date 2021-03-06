# frozen_string_literal: true

class AddUserIdToHitch < ActiveRecord::Migration[6.1]
  def change
    add_reference :hitches, :user, type: :uuid, foreign_key: true
  end
end
