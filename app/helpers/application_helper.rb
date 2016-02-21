module ApplicationHelper
  def message_type(key)
    sym_key = key.try(:to_sym)

    types = {
      info: 'info',
      alert: 'danger',
      error: 'danger',
      warning: 'warning',
      success: 'success',
      notice: 'success'
    }

    types.key?(sym_key) ? types[sym_key] : types[:info]
  end
end
