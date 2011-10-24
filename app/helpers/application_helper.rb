module ApplicationHelper

  def timestamped(url, object)
    "#{url}?#{object.updated_at.to_i}"
  end

end
