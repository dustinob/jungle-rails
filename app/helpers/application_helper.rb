module ApplicationHelper
  def logged_in?
    not request.authorization.nil?
  end

  def empty_cart_link
    link_to "Jungle Store", "/"
  end
end
