class RootController < ApplicationController
  def index
  	@alerts = Alert.order("id desc").all
  end
end
