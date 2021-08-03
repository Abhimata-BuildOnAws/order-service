# frozen_string_literal: true

class EmissionRecordSerializer
  include JSONAPI::Serializer

  attributes :month, :carbon_emission, :carbon_emission_saved, :effective_carbon_emission, :number_of_tumpang, :average_carbon_emission
end
