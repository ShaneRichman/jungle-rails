class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.user_id = current_user
    if @review.save
      redirect_to "/products/#{@product.id}"
    else
      redirect_to "/products/#{@product.id}"
    end
  end

  def review_params
    params.require(:review).permit(:rating, :description, :product_id)
  end

end