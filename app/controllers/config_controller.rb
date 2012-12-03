class ConfigController < ApplicationController
  def index
    @app = App.all.last
  end

  def new
    @app = App.new
  end

  def create
    a = App.all
    if a[0]
      a = a[0]
      if a.update_attribute(:email, params[:app][:email])
        flash[:notice] = "Email Configurado Satisfactoriamente"
        respond_to do |format|
          format.html {redirect_to config_path a}
          format.json { render json: a}
        end
      else
        respond_to do |format|
          format.html {render 'new'}
          format.json { render json: a}
        end
      end
    else
      a = App.new(params[:app])
      if a.save
        flash[:notice] = "Email Configurado Satisfactoriamente"
        respond_to do |format|
          format.html {redirect_to config_path a}
          format.json { render json: a}
        end
      else
        respond_to do |format|
          format.html {render 'new'}
          format.json { render json: a}
        end
      end
    end
  end

  def show
    @app = App.find(params[:id])
  end

  def update
  end

  def edit
  end
end
