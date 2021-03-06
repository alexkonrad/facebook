class LikesController < ApplicationController
  def create
    @like = current_user.likes.create({
      likeable_id: params[:likeable_id],
      likeable_type: params[:likeable_type]
    })

    user = (@like.likeable_type == "Post") ? @like.likeable.author : @like.likeable.user
    notify!(user, @like)

    if request.xhr?
      render json: @like
    else
      flash[:notices] = ["liked"]
      redirect_to :back
    end
  end

  def destroy
    @like = current_user.likes.where(id: params[:id]).first!

    @like.destroy

    if request.xhr?
      render json: @like
    else
      flash[:notices] = ["unliked"]
      redirect_to :back
    end
  end
end
