class NotInPastValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "can't be in the past") unless !value || value >= Time.zone.today
  end
end