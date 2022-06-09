module ApplicationHelper
  BASE_TITLE = 'GET&READY'.freeze
  def full_title(page_title)
    page_title.blank? ? BASE_TITLE : "#{page_title} - #{BASE_TITLE}"
  end

  def flash_message(message, klass)
    tag.div(class: "alert mb-0 alert-#{klass}") do
      concat raw(message)
    end
  end
end
