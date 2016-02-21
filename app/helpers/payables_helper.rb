module PayablesHelper
  def currency(value)
    return '-' if value.blank?

    format("%.2f", value)
  end

  def format_date(date)
    date.try(:strftime, '%d.%m.%Y')
  end

  def recurring_types_collection
    RecurringService::ALLOWED.map { |type| [type.to_s.titleize, type] }
  end

  def form_amount(payable)
    if payable.persisted? && payable.next_item
      currency(payable.next_amount)
    elsif payable.persisted?
      currency(payable.items.last.amount)
    end
  end

  def form_due_on(payable)
    if payable.persisted? && payable.next_item
      format_date(payable.next_due_on)
    end
  end

  def form_recurring_ends_on(payable)
    format_date(payable.recurring_ends_on) if begin
      payable.persisted? &&
      payable.recurring_ends_on.present? &&
      payable.recurring_ends_on >= Date.today
    end
  end
end
