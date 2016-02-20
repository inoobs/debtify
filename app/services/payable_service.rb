class PayableService
  def self.create(params, user)
    payable = user.payables.new(
      name: params[:name],
      description: params[:description],
      recurring_type: params[:recurring_type],
      recurring_ends_on: params[:recurring_ends_on]
    )

    item = payable.items.new(
      due_on: params[:due_on],
      amount: params[:amount]
    )

    if payable.valid? && item.valid?
      payable.save!
      payable
    else
      payable
    end
  end
end
