# frozen_string_literal: true

class LoungesController < ApplicationController
  before_action :set_lounge, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @lounges = Lounge.all
  end

  def show; end

  def new
    @lounge = current_user.build_lounge
    @lounge.build_address
  end

  def edit; end

  def create
    @lounge = current_user.build_lounge(lounge_params)

    respond_to do |format|
      if @lounge.save
        format.turbo_stream { redirect_to lounge_url(@lounge), notice: 'Lounge was successfully created.' }
        format.html { redirect_to lounge_url(@lounge) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lounge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lounge.update(lounge_params)
        format.turbo_stream { redirect_to lounge_url(@lounge), notice: 'Lounge was successfully updated.' }
        format.html { redirect_to lounge_url(@lounge), notice: 'Lounge was successfully updated.' }
        format.json { render :show, status: :ok, location: @lounge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lounge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lounge.destroy
    redirect_to root_path, status: :see_other, notice: 'Lounge was successfully deleted.'
  end

  def my_lounge
    @current_user_lounge = current_user.lounge
    return if @current_user_lounge.present?

    redirect_to root_path, status: :not_found,
                           notice: 'Sorry, your lounge could not be found.'
  end

  private

  def set_lounge
    @lounge = Lounge.find(params[:id])
  end

  def lounge_params
    params.require(:lounge).permit(:name, :phone_number, :email, :description, :alcohol_served, :food_served,
                                   :outside_alcohol_allowed, :outside_cigars_allowed, :logo,
                                   address_attributes: %i[id address_street_1 address_street_2 city state zipcode],
                                   display_images: [])
  end
end
