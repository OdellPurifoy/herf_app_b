# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :set_lounge, only: %i[index new create]
  before_action :authenticate_user!, only: %i[new edit create update destroy]

  def index
    @events = @lounge.events.order(created_at: :desc).page(params[:page])
  end

  def show; end

  def new
    @event = @lounge.events.build
  end

  def edit; end

  def create
    @event = @lounge.events.build(event_params)

    respond_to do |format|
      if @event.save
        notify_members(@event)
        format.turbo_stream { redirect_to event_path(@event) }
        flash[:notice] = 'Event successfully created.'
        format.html { redirect_to event_url(@event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        updated_event_members_notification(@event)
        format.turbo_stream { redirect_to [@lounge, @event] }
        flash[:notice] = 'Event successfully updated.'
        format.html { redirect_to event_url(@event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    canceled_event_members_notification(@event)
    @event.destroy

    redirect_to root_path, status: :see_other
    flash[:notice] = 'Event successfully deleted.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_lounge
    @lounge = Lounge.find(params[:lounge_id])
  end

  def event_params
    params.require(:event).permit(:event_name, :event_date, :event_type, :event_description, :event_url, :zoom_code, :rsvp_needed, :maximum_capacity,
                                  :start_time, :end_time, :members_only, :is_virtual, :flyer)
  end

  def notify_members(event)
    event.lounge.memberships.active.each do |membership|
      MemberNewEventMailer.with(membership: membership, event: event).notify.deliver_now
    end
  end

  def updated_event_members_notification(event)
    event.lounge.memberships.active.each do |membership|
      MemberUpdateEventMailer.with(membership: membership, event: event).notify.deliver_now
    end
  end

  def canceled_event_members_notification(event)
    event.lounge.memberships.active.each do |membership|
      MemberCanceledEventMailer.with(membership: membership, event: event).notify.deliver_now
    end
  end
end
