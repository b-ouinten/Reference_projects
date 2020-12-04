module ApplicationHelper
  def flash_class(type)
    case type
      when 'notice' then 'alert alert-info'
      when 'success' then 'alert alert-success'
      when 'alert' then 'alert alert-warning'
      when 'danger' then 'alert alert-danger'
      when 'error' then 'alert alert-danger'
    end
  end
end