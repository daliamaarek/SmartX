class TypesController < ApplicationController
  #Returns list of types. 
  # GET /types
  # GET /types.json
  def index
    @types = Type.all
    render json: @types if stale?(etag: @types.all, last_modified: @types.maximum(:updated_at))
  end
  
  #Creates type with given parameters.
  # POST /types
  # POST /types.json
  def create
    @type = Type.new(type_params)
    if @type.save
      render json: @type, status: :created
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  #Deletes type with given id.
  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
  	@type=Type.find(params[:id])
    @type.destroy
    head :no_content
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def type_params
    params.require(:type).permit(:name)	
  end
end
