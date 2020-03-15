class Api::V1::DraftsController < ApplicationController
    before_action :set_draft, only: %i[show update destroy]

  def index
    render json: Draft.all
  end

  def show
    render json: @draft
  end

  def create
    draft = Draft.new(draft_params)

    if draft.save
      render json: draft, status: :created
    else
      render json: draft.errors, status: :unprocessable_entity
    end
  end

  def update
    if @draft.update(draft_params)
      render json: @draft
    else
      render json: @draft.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @draft.destroy
  end

  private

  def set_draft
    @draft = draft.find(params[:id])
  end

  def draft_params
    params.require(:draft).permit(:name, :manager)
  end
end
