module ApplicationHelper
  def sortable(name, sort_by)
    link_to name, sort: sort_by
  end

  def filterable(name, filter_by)
    link_to name, filter: filter_by
  end
end
