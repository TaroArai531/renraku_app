module ApplicationHelper
  BASE_TITLE = '連絡帳'.freeze
  def full_title(page_title)
    page_title.blank? ? BASE_TITLE : "#{page_title} - #{BASE_TITLE}"
  end

  def flash_message(message, klass)
    tag.div(class: "alert alert-#{klass}") do
      concat tag.button('x', class: 'close', data: { dismiss: 'alert' })
      concat raw(message)
    end
  end
end
