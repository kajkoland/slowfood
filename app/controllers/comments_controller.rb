class CommentsController < ApplicationController
	def create
		@recipe = Recipe.find(params[:recipe_id])
		@comment =@recipe.comments.create(params[:comment].permit(:author, :body))
		@comment.author = current_user.email
		@comment.save

		redirect_to recipe_path(@recipe)
	end



end
