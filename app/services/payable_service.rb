class PayableService
  def self.create(user:, params:)
    payable = user.payables.new(
      name: params[:name],
      description: params[:description],
      recurring_type: params[:recurring_type].presence,
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

  def self.update(id:, user:, params:)
    payable = user.payables.find(id)

    payable.attributes = {
      name: params[:name],
      description: params[:description],
      recurring_type: params[:recurring_type].presence,
      recurring_ends_on: params[:recurring_ends_on]
    }

    recurring = RecurringService.new(
      type: params[:recurring_type],
      starts_on: params[:due_on],
      ends_on: params[:recurring_ends_on]
    )

    destroyable_item_ids = payable.items.today_and_future.pluck(:id)

    first_item = payable.items.new(
      due_on: params[:due_on],
      amount: params[:amount]
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
      PayableItem.destroy_all(id: destroyable_item_ids)
      payable
    else
      payable
    end
  end
end
