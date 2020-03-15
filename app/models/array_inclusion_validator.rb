# frozen_string_literal: true

# This validators checks if the value is included in the array
class ArrayInclusionValidator < ActiveModel::EachValidator
  include ActiveModel::Validations::Clusivity

  def validate_each(record, attribute, values)
    values.each do |value|
      next if include?(record, value)
      message = (
        options[:message].try(:gsub, '%{value}', value) ||
          "#{value} is not included in the list")
      record.errors.add(attribute, :array_inclusion, message: message, value: value)
    end
  end
end
