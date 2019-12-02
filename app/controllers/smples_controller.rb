class SmplesController < ApplicationController
  before_action :set_smple, only: [:show, :edit, :update, :destroy]

  # GET /smples
  # GET /smples.json
  def index
    respond_to do |format|
      format.html
      format.js { render :action => 'index' }
    end
    @smples = Smple.all
    record_relation = Smple.all
    #record_relation = Smple.where('grp == "B"')
    @xcords = helpers.get_x_coordinates(record_relation)
    @ycords = helpers.get_y_coordinates(record_relation)
    @heights = helpers.height_coordinates(record_relation)
    @classnames = helpers.set_class(record_relation)
    @xlabels = helpers.get_x_label(record_relation)
    @xlabelpos = helpers.get_x_label_pos(record_relation)
    @legclass = helpers.set_leg_class(record_relation)
    @legname = helpers.set_leg_label(record_relation)
  end

  # GET /smples/1
  # GET /smples/1.json
  def show
  end

  # GET /smples/new
  def new
    @smple = Smple.new
  end

  # GET /smples/1/edit
  def edit
  end

  # POST /smples
  # POST /smples.json
  def create
    @smple = Smple.new(smple_params)

    respond_to do |format|
      if @smple.save
        format.html { redirect_to smples_url, notice: 'Smple was successfully created.' }
        format.json { render :show, status: :created, location: @smple }
      else
        format.html { render :new }
        format.json { render json: @smple.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smples/1
  # PATCH/PUT /smples/1.json
  def update
    respond_to do |format|
      if @smple.update(smple_params)
        format.html { redirect_to @smple, notice: 'Smple was successfully updated.' }
        format.json { render :show, status: :ok, location: @smple }
      else
        format.html { render :edit }
        format.json { render json: @smple.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smples/1
  # DELETE /smples/1.json
  def destroy
    @smple.destroy
    respond_to do |format|
      format.html { redirect_to smples_url, notice: 'Smple was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smple
      @smple = Smple.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def smple_params
      params.require(:smple).permit(:par1, :par2, :grp)
    end
end
