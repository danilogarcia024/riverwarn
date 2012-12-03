class AlertsController < ApplicationController
  def index
    @alert = Alert.all.last
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alert}
    end
  end

  def new
    @alert = Alert.new
  end

  def create
    alert = Alert.new(params[:alert])

    if alert.save
      flash[:notice] = "Alerta Registrada Satisfactoriamente"
      respond_to do |format|
        format.html {redirect_to alert}
        format.json { render json: alert}
      end 
    else
      respond_to do |format|
        format.html {render new}
        format.json { render json: alert}
      end
    end
  end

  def show
    @alert = Alert.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
