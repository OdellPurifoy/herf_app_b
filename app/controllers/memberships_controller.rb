# frozen_string_literal: true

class MembershipsController < ApplicationController
  before_action :set_membership, only: %i[show edit update destroy]
  before_action :set_lounge, only: %i[index new create]
  before_action :authenticate_user!

  def index
    @memberships = if params[:search].present?
                     Membership.search(params[:search])
                   else
                     @lounge.memberships.order(:created_at).page(params[:page])
                   end
  end

  def show; end

  def new
    @membership = @lounge.memberships.build
  end

  def edit; end

  def create
    @membership = @lounge.memberships.build(membership_params)

    respond_to do |format|
      if @membership.save
        new_member_welcome_email(@membership)
        format.turbo_stream { redirect_to membership_path(@membership) }
        flash[:notice] = 'Membership successfully created.'
        format.html { redirect_to membership_url(@membership), notice: 'Membership was successfully created.' }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @membership.update(membership_params)
        updated_membership_email(@membership)
        format.turbo_stream { redirect_to [@lounge, @membership] }
        format.html { redirect_to membership_url(@membership), notice: 'Membership was successfully updated.' }
        flash[:notice] = 'Membership successfully updated.'
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lounge = @membership.lounge

    canceled_membership_email(@membership)

    @membership.destroy
    redirect_to "/lounges/#{@lounge.id}/memberships", status: :see_other
    flash[:notice] = 'Membership successfully deleted.'
  end

  def activate
    @membership = Membership.find(params[:id])
    @lounge = @membership.lounge
    @membership.update!(active: true)
    redirect_to lounge_memberships_path(@lounge)
    flash[:notice] = 'Membership activated'
  end

  def deactivate
    @membership = Membership.find(params[:id])
    @lounge = @membership.lounge
    @membership.update!(active: false)
    redirect_to lounge_memberships_path(@lounge)
    flash[:notice] = 'Membership deactivated'
  end

  private

  def set_membership
    @membership = Membership.find(params[:id])
  end

  def set_lounge
    @lounge = Lounge.find(params[:lounge_id])
  end

  def membership_params
    params.require(:membership).permit(:first_name, :last_name, :email, :phone_number, :do_not_text)
  end

  def new_member_welcome_email(membership)
    NewMemberWelcomeMailer.with(membership: membership, lounge: membership.lounge).send_welcome_email.deliver_now
  end

  def updated_membership_email(membership)
    UpdateMembershipMailer.with(membership: membership, lounge: membership.lounge).notify.deliver_now
  end

  def canceled_membership_email(membership)
    DeletedMembershipMailer.with(membership: membership, lounge: membership.lounge).notify.deliver_now
  end
end
