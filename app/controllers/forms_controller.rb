class FormsController < ApplicationController
  before_action :set_form, only: [:show, :update, :destroy]

  def index
    @forms = Form.all

    render json: @forms, only: [:id, :first_name, :birth_date, :os, :something_about]
  end

  def show
    render json: @form, only: [:id, :first_name, :birth_date, :os, :something_about]
  end

  def create
    @form = Form.new(form_params)

    if @form.save
      render json: @form, status: :created, location: @form
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  def update
    if @form.update(form_params)
      render json: @form
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @form.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_form
    @form = Form.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def form_params
    params.require(:form).permit(:first_name, :birth_date, :os, :something_about)
  end
end
