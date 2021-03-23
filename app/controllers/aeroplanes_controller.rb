class AeroplanesController < ApplicationController
  before_action :authorize_access_request!
  before_action :aeroplane_params
  # include CategoryInteractor
  def index
    @aeroplanes = Aeroplane.all
    render json: @aeroplanes
  end

  def show
  end

  def create
    @aeroplane = Aeroplane.new(create_aeroplane_params)
    # classes = params['classes']
    # result = ::CategoryInteractor.call(classes)
    
    if @aeroplane.save
      if(create_classes)
        msg = {:status => "ok", :message => "Aeroplane Model and Confiqurations Added Succesfully"}
			  render json: msg, status: :created
      end
		else
			render json: @aeroplane.errors, status: :unprocessable_entity
		end
  end

  def create_classes
    @classes = params['classes']
    @classes.each_key do |key|
      @category = Category.new(aeroplane_id: @aeroplane.id , name: key , rows: @classes[key]['rows'] , cols: @classes[key]['cols'])
      @category.save
    end
      return true
  end

  def update
  end

  def destroy
  end

  private
	def aeroplane_params
		params.permit(:model,:seats_no, :classes)
	end
	def create_aeroplane_params
		params.require(:aeroplane).permit(:model , :seats_no)
	end
end