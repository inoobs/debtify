module PayablesHelper
  def currency(value)
    return '-' if value.blank?

    format("%.2f", value)
  end
end
