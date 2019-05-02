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

  def create
    @comedian = Comedian.new(comedian_params)
    @comedian.save

    redirect_to("/comedians")
  end

  private

  def comedian_params
    params.require(:comedian).permit(:name, :age, :birthplace)
  end

end
