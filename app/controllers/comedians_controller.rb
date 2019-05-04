class ComediansController < ApplicationController

  def index
    if params[:age] == nil
      @comedians = Comedian.all
    else
      @comedians = Comedian.find_by_age(params[:age])
    end
    
    @specials        = Special.all
    @total_specials  = @specials.total_specials
    @average_runtime = @specials.average_runtime

    @average_age       = @comedians.average_age
    @display_comedians = @comedians.order_by(params[:sort])
  end

  def show
    @comedian = Comedian.find(params[:id])
  end

  def new
    @comedian = Comedian.new
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
