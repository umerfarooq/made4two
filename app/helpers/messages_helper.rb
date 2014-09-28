module MessagesHelper
  def date_message(date)
    date.to_formatted_s(:long)
  end
end
