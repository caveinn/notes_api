class StreamsController < ApplicationController
  skip_before_action :authorize_request, only: [:show, :index]
  before_action :set_school
  before_action :set_stream, only: [:show, :update, :destroy]

  # GET /schools/:school_id/streams
  def index
    json_response(@school.streams)
  end

  # GET /schools/:school_id/streams/:id
  def show
    json_response(@stream)
  end

  # POST /schools/:school_id/streams
  def create
    @school.streams.create!(stream_params)
    render json: @school, include: [:streams]
  end

  # PUT /schools/:school_id/streams/:id
  def update
    if @stream.update(stream_params)
    render json: @stream
    else
      render json: @stream.errors, status: :unprocessable_entity
    end  
  end

  # DELETE /schools/:school_id/streams/:id
  def destroy
    @stream.destroy
    head :no_content
  end

  private

  def stream_params
    params.permit(:name)
  end

  def set_school
    @school= School.find(params[:school_id])
  end

  def set_stream
    @stream = @school.streams.find_by!(id: params[:id]) if @school
  end
end
