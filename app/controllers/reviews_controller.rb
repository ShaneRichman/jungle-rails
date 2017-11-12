class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to "/products/#{@product.id}"
    else
      redirect_to "/products/#{@product.id}"
    end
  end

  def review_params
    params.require(:review).permit(:rating, :description, :user_id, :product_id)
  end

  def destroy
    byebug
    @review = Review.find params[:id]
    @review.destroy
    redirect_to "/products/#{@product.id}", notice: 'Review deleted!'
  end

end