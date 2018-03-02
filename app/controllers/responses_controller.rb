class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]
  before_action :set_questions, only: [:new, :edit, :update, :create]

  before_action :requires_admin, only: [:index, :edit, :update, :show]

  # GET /responses
  # GET /responses.json
  def index
    sesssion[:session_uuid] = nil
    @responses = Response.order('created_at')
    @page_views = Event.where(kind: 'pageLoad').count

    @by_campaign = {}
    @responses.each do |response|
      @by_campaign[response.campaign] = {
          count: 0,
          first_time: 0
      } if @by_campaign[response.campaign].nil?

      @by_campaign[response.campaign][:count] += 1
      @by_campaign[response.campaign][:first_time] += 1 if Event.where(kind: 'pageLoad', session: response.session).count == Event.where(kind: 'pageLoad', view: response.view).count
    end
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    puts response_params
    @response = Response.new(response_params)

    respond_to do |format|
      if @response.save
        session[:session_uuid] = nil

        format.html { render :thanks }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_response
    @response = Response.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def response_params
    params.require(:response).permit(:session, :view, :email, :name, :campaign).to_h.tap do |parameters|
      parameters[:answers] = {}

      QUESTIONS.each do |key, opts|
        parameters[:answers][key] = params[:response][:answers][key]

        if opts[:type] == 'rank'
          parameters[:answers][key] = JSON(parameters[:answers][key])
        end
      end
    end
  end

  def set_questions
    @questions = QUESTIONS
  end
end
