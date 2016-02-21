module PayablesHelper
  def currency(value)
    return '-' if value.blank?

    format("%.2f", value)
  end

  def recurring_types_collection
    RecurringService::ALLOWED.map { |type| [type.to_s.titleize, type] }
  end
end
