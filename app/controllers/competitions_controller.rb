class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:edit, :update, :destroy]
  before_action :check_permissions, only: [:edit, :update]

  # GET /competitions
  # GET /competitions.json
  def index
    term = params[:term]
      if term
        if current_user.try(:admin)
          competitions = Competition.search_by_name(params[:term]).order('id DESC')
          #competitions = Competition.where('name LIKE ?', params[:term]).order('id DESC')
          competitions = Competition.all.order('id DESC') if params[:term] == ""
        else
          competitions = Competition.anyone.where('name LIKE ?', params[:term]).order('id DESC')
          competitions = Competition.anyone.order('id DESC') if params[:term] == ""
        end
      else
        competitions = current_user.comps + (current_user.competitions - current_user.comps)
      end
    @competitions = competitions.paginate(page: params[:page], per_page: 10)
  end

  def join
    curUsr = current_user
    competition = Competition.find params[:id]
    if competition.users.exists? curUsr.id
      competition.users.delete curUsr
      redirect_to root_path, alert: "You have left #{competition.name}"
    else
      competition.users<< curUsr
      redirect_to root_path, notice: "You have joined #{competition.name}"
    end
  end



  # GET /competitions/1
  # GET /competitions/1.json
  def show
    @competition = Competition.includes(:challenges).find(params[:id])
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions
  # POST /competitions.json
  def create
    params[:competition] ||= {}
    params[:competition]["owner_id"] = current_user.id
    @competition = Competition.new(competition_params)

    respond_to do |format|
      if @competition.save
        format.html { redirect_to competitions_path, notice: 'Competition was successfully created.' }
        format.json { render :show, status: :created, location: @competition }
      else
        format.html { render :new }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitions/1
  # PATCH/PUT /competitions/1.json
  def update
    respond_to do |format|
      if @competition.update(competition_params)
        format.html { redirect_to competitions_path, notice: 'Competition was successfully updated.' }
        format.json { render :show, status: :ok, location: @competition }
      else
        format.html { render :edit }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitions/1
  # DELETE /competitions/1.json
  def destroy
    @competition.destroy
    respond_to do |format|
      format.html { redirect_to competitions_url, notice: 'Competition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.includes(:challenges).find(params[:id])
    end

    def check_permissions
      unless current_user.try(:admin) || @competition.owner == current_user
        redirect_to root_path, alert: "You don't have permission to edit that"
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_params
      params.require(:competition).permit(:owner_id, :name, :public, :start, :stop)
    end
end
