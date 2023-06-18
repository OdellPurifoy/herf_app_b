class RsvpsController < ApplicationController
  before_action :set_rsvp, only: %i[ show edit update destroy ]
  before_action :set_event, only: %i[index new create]
  before_action :authenticate_user!, only: %i[new edit create update destroy]

  def index
    @rsvps = @event.rsvps.order(:created_at)
  end

  def show
  end

  def new
    @rsvp = @event.rsvps.build
  end

  def edit
  end

  def create
    @rsvp = @event.rsvps.build(rsvp_params)

    respond_to do |format|
      if @rsvp.save
        format.turbo_stream { redirect_to rsvp_path(@rsvp) }
        format.html { redirect_to rsvp_url(@rsvp), notice: "Your RSVP was successfully created." }
        format.json { render :show, status: :created, location: @rsvp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rsvp.update(rsvp_params)
        format.turbo_stream { redirect_to [@lounge, @event] }
        format.html { redirect_to rsvp_url(@rsvp), notice: "Rsvp was successfully updated." }
        format.json { render :show, status: :ok, location: @rsvp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rsvp.destroy
    
    redirect_to event_rsvps_path(@event), status: :see_other
    flash[:notice] = 'Event successfully deleted.'
  end

  private
    def set_rsvp
      @rsvp = Rsvp.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def rsvp_params
      params.require(:rsvp).permit(:first_name, :last_name, :phone_number, :email, :number_of_guests, :attended)
    end
end
