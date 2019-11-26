class NotesController < ApplicationController
    skip_before_action :authorize_request, only: [:show, :index]
    before_action :set_school, :set_stream
    before_action :set_note, only: [:show, :update, :destroy]
  
    # GET /schools/:school_id/streams/:stream_id/notes
    def index
      render json: @stream.notes
    end
  
    # GET /schools/:school_id/streams/:stream_id/notes/:id
    def show
      json_response(@note)
    end
  
    # POST /schools/:school_id/streams/:stream_id/notes
    def create
      @note = @current_user.notes.create!(note_params)
      json_response(@note, :created)
    end
  
    # PUT /schools/:school_id/streams/:stream_id/notes/:id
    def update
      if @note.update(note_params)
      render json: @stream
      else
        render json: @stream.errors, status: :unprocessable_entity
      end  
    end
  
    # DELETE /schools/:school_id/streams/:stream_id/notes/:id
    def destroy
      @note.destroy
      head :no_content
    end
  
    private
  
    def note_params
        # byebug
      params.permit(:subject, :topic, :notes, :user_id, :stream_id)
    end
  
    def set_school
      @school= School.find(params[:school_id])
    end
  
    def set_stream
      @stream = @school.streams.find(params[:stream_id]) if @school
    end

    def set_note
        @note = @stream.notes.find_by!(id: params[:id]) if @stream
    end
  end
  