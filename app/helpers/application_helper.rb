module ApplicationHelper
  def nav_link(link_text, link_path)
    cur = current_page?(link_path)
    li_class_name = cur ? 'nav-item active px-lg-4' : 'nav-item px-lg-4'
    a_class_name = 'nav-link text-uppercase text-expanded'
    txt = cur ? content_tag(:span, "(current)", :class=>'sr-only') : nil
    content_tag(:li, :class => li_class_name) do
      link_to link_path, :class => a_class_name do
        raw(link_text + txt.to_s)
      end
    end
  end
end

