module FormHelper

  def multi_checkbox_tabs(form, name, tab_collection, checkbox_selection)
    html = "<nav class='nav nav-tabs' id='#{name}Tabs' role='tablist'>"

    tab_collection.each_with_index do |item, index|
      html += "<a class='nav-item nav-link #{'active' if index.zero?}' id='tab-'#{item.name}' data-toggle='tab' role='tab' aria-controls='nav-#{item.name}' href='#nav-#{item.name}'>"
      html += item.name
      html += "</a>"
    end

    html += "</nav>"

    html += "<div class='tab-content' id='nav-#{name}Content'>"

    checkbox_selection.each_with_index do |(group, items), index|
      html += "<div class='tab-pane fade #{'show active' if index.zero?}' id='nav-#{group.name}' role='tabpanel' aria-labelledby='nav-#{group.name}-tab'>"
      html += form.association :events, collection: items, as: :check_boxes, label: false, class: 'text'
      html += "</div>"
    end

    html += "</div>"

    raw(html)
  end
end