class EmotitionsController < ApplicationController
  before_action :load_review,:load_emotition

  def create
    @emotition.emotition_type = if @emotition.like? && params[:emotition_type] == :dislike
       :dislike
    elsif @emotition.dislike? && params[:emotition_type] == :like
      :like
    else
      params[:emotition_type]
    end
    @emotition.save
  end

  private
  def load_review
    @review = Review.find_by id: params[:review_id]
    unless @review
      flash[:danger] = "Review not exist!"
      redirect_to root_path
    end
  end

  def load_emotition
    @emotition = @review.emotitions.find_by user: current_user
    unless @emotition
      @emotition = @review.emotitions.build user: current_user
    end
  end
end
