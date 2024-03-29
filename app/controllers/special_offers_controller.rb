# frozen_string_literal: true

class SpecialOffersController < ApplicationController
  before_action :set_special_offer, only: %i[show edit update destroy]
  before_action :set_lounge, only: %i[index new create]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @special_offers = if params[:search].present?
                        SpecialOffer.search(params[:search]).order(created_at: :desc).page(params[:page])
                      else
                        @lounge.special_offers.order(created_at: :desc).page(params[:page])
                      end
  end

  def show; end

  def new
    @special_offer = @lounge.special_offers.build
  end

  def edit; end

  def create
    @special_offer = @lounge.special_offers.build(special_offer_params)

    respond_to do |format|
      if @special_offer.save
        new_special_offer_email(@special_offer)
        format.turbo_stream { redirect_to special_offer_path(@special_offer) }
        flash[:notice] = 'Special offer successfully created.'
        format.html { redirect_to special_offer_url(@special_offer), notice: 'Special offer was successfully created.' }
        format.json { render :show, status: :created, location: @special_offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @special_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @special_offer.update(special_offer_params)
        update_special_offer_email(@special_offer)
        format.turbo_stream { redirect_to [@lounge, @special_offer] }
        flash[:notice] = 'Special offer successfully updated.'
        format.html { redirect_to special_offer_url(@special_offer), notice: 'Special offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @special_offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @special_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    delete_special_offer_email(@special_offer)
    @special_offer.destroy
    flash[:notice] = 'Special offer successfully deleted.'
    redirect_to root_path, status: :see_other
  end

  private

  def set_special_offer
    @special_offer = SpecialOffer.find(params[:id])
  end

  def set_lounge
    @lounge = Lounge.find(params[:lounge_id])
  end

  def special_offer_params
    params.require(:special_offer).permit(:name, :start_date, :end_date, :description, :members_only, :offer_type,
                                          :offer_code, :flyer)
  end

  def new_special_offer_email(special_offer)
    special_offer.lounge.memberships.active.each do |membership|
      NewSpecialOfferMailer.with(special_offer: special_offer, membership: membership).notify.deliver_now
    end
  end

  def update_special_offer_email(special_offer)
    special_offer.lounge.memberships.active.each do |membership|
      UpdateSpecialOfferMailer.with(special_offer: special_offer, membership: membership).notify.deliver_now
    end
  end

  def delete_special_offer_email(special_offer)
    special_offer.lounge.memberships.active.each do |membership|
      DeleteSpecialOfferMailer.with(special_offer: special_offer, membership: membership).notify.deliver_now
    end
  end
end
