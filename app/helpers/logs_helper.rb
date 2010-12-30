module LogsHelper
  def link_to_order(column, title=nil)
    title   ||= column.titleize
    is_order  = params[:order_by] == column
    ascending = params[:order_direction] == 'asc'

    direction  = is_order && ascending ? 'desc' : 'asc'
    link_text  = is_order ? (ascending ? "#{title} ^" : "#{title} v") : title
    link_to link_text, {:order_by => column, :order_direction => direction, :filters => params[:filters]}
  end
end
