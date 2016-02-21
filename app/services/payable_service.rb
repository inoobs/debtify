class PayableService
  def self.create(params, user)
    payable = user.payables.new(
      name: params[:name],
      description: params[:description],
      recurring_type: params[:recurring_type],
      recurring_ends_on: params[:recurring_ends_on]
    )

    first_item = payable.items.new(
      due_on: params[:due_on],
      amount: params[:amount]
    )

    recurring = RecurringService.new(
      type: params[:recurring_type],
      starts_on: params[:due_on],
      ends_on: params[:recurring_ends_on]
    )

    if recurring.valid?
      recurring.generate_next_dates.each do |next_due_on|
        payable.items.new(
          due_on: next_due_on,
          amount: params[:amount]
        )
      end
    end

    if payable.valid? && first_item.valid?
      payable.save!
      payable
    else
      payable
    end
  end
end
