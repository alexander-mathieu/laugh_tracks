class ComediansController < ApplicationController

  def index
    if params[:age] == nil
      @comedians = Comedian.all
    else
      @comedians = Comedian.find_by_age(params[:age])
    end
  end

  def new

  end

end
