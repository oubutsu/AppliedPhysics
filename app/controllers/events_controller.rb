class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :postcreate]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  # showでmicropostのnewも行っている
  def show
    @micropost = @event.microposts.build
    #   redirect_to @event
    # else
    #   redirect_to @event
    # end
  end

  def postcreate
    @micropost = @event.microposts.build(post_params)
    if @micropost.editor.blank?
      @micropost.editor = '名無しの権兵衛'
    end
    if @micropost.save
      redirect_to @event
    else
      redirect_to @event
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.save!
    redirect_to @event
    rescue
      flash.now[:danger] = '必須な項目が入力されていません'
      render 'new'
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :deadline, :place, :comment, :info, :event_type)
    end
    def post_params
      params.require(:micropost).permit(:content, :event_id, :created_at, :editor)
    end
end
