class RecurringService
  ALLOWED = %i(daily weekly monthly yearly)
  MAX_DATES_WO_ENDS_ON = 10

  def initialize(type:, starts_on:, ends_on:)
    @type = type.try(:to_sym)
    @starts_on = starts_on.try(:to_date)
    @ends_on = ends_on.try(:to_date)
  end

  def valid?
    ALLOWED.include?(@type) && @starts_on
  end

  def generate_next_dates
    if valid?
      send(@type)
    else
      []
    end
  end

  private

  def daily
    number = begin
      if @ends_on.blank?
        MAX_DATES_WO_ENDS_ON
      else
        (@ends_on - @starts_on).to_i
      end
    end

    if number > 0
      (1..number).map do |n|
        date = @starts_on + n.day
        date if @ends_on.blank? || date <= @ends_on
      end.compact
    else
      []
    end
  end

  def weekly
    number = begin
      if @ends_on.blank?
        MAX_DATES_WO_ENDS_ON
      else
        (@ends_on - @starts_on).to_i / 7
      end
    end

    if number > 0
      (1..number).map do |n|
        date = @starts_on + n.week
        date if @ends_on.blank? || date <= @ends_on
      end.compact
    else
      []
    end
  end

  def monthly
    number = begin
      if @ends_on.blank?
        MAX_DATES_WO_ENDS_ON
      else
        (@ends_on.year * 12 + @ends_on.month) -
          (@starts_on.year * 12 + @starts_on.month)
      end
    end

    if number > 0
      (1..number).map do |n|
        date = @starts_on + n.month
        date if @ends_on.blank? || date <= @ends_on
      end.compact
    else
      []
    end
  end

  def yearly
    number = begin
      if @ends_on.blank?
        MAX_DATES_WO_ENDS_ON
      else
        @ends_on.year - @starts_on.year
      end
    end

    if number > 0
      (1..number).map do |n|
        date = @starts_on + n.year
        date if @ends_on.blank? || date <= @ends_on
      end.compact
    else
      []
    end
  end
end
