class ReviewsController < ApplicationController
  # before_action :require_login

  def create
    if !current_user
      @product = Product.find(params[:product_id])
      redirect_to product_path(@product)
      return
    end

    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    @review.save
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.user = current_user
    @review.destroy
    redirect_to product_path(@product)
  end


  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end
  #
  # private
  #   def require_login
  #   unless logged_in?
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to new_login_url # halts request cycle
  #   end
  # end
end
