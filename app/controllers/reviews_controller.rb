class ReviewsController < ApplicationController
  before_action :authorize_user, only: :create

  def create
    user = params[:user_id]
    description = params[:description]
    product = Product.find_by_id(params[:product_id])
    review = product.reviews.new(user_id: user, product_id: product.id, description: description)

    redirect_to :back if review.save
  end
end
