module ApplicationHelper
  def ft(s); t("formtastic.labels.#{s.to_s}") end
  def lbl(s); "#{:label}.#{s}" end
  def new(s); t2(:new,s) end
  def sortable(col, title = col.titlelize)
    css_class = col == sort_column ? sort_direction : nil
    direction = col == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, {:sort => col, :direction => direction}, {:class => css_class}
  end
  def t2(s1,s2); t(lbl(s1),:obj=>t(s2)) end
end
