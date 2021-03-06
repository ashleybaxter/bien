class ReviewsController < ApplicationController
	def index
		@reviews = Review.all
	end

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(form_params)
		if @review.save
			redirect_to root_path
		else
			render "new"
		end
	end

	def show
		@review = Review.find(params[:id])
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to root_pathxw
	end

	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
		if @review.update(form_params)
			redirect_to review_path(@review)
		else
			render "edit"
		end
	end

	def form_params
		params.require(:review).permit(:title, :restaurant, :body, :ambiance, :score)
	end
end
