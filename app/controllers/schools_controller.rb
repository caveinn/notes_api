class SchoolsController < ApplicationController
  skip_before_action :authorize_request, only: [:show, :index]
  before_action :set_school, only: [:show, :update, :destroy]
  before_action :check_owner, only: [:update,:destroy]

  # GET /schools
  def index
    @schools = School.all

    render json: @schools, include: [:streams]
  end

  # GET /schools/1
  def show
    render json: @school
  end

  # POST /schools
  def create

    @school = @current_user.schools.new(school_params)

    if @school.save
      render json: @school, status: :created, location: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schools/1
  def update
    if @school.update(school_params)
      render json: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end  
  end

  # DELETE /schools/1
  def destroy
    @school.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    #check the authorized user is the owner of the school.
    def check_owner 
      set_school
      unless @school.user == @current_user
        render json: {"message": "You can only update schools you created"}, status: :unauthorized
      end
    end

    # Only allow a trusted parameter "white list" through.
    def school_params
      params.require(:school).permit(:name, :user_id)
    end
end
