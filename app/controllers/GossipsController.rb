class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = User.find_by(name: 'anonymous') # Assignation à l'utilisateur 'anonymous'

    if @gossip.save
      flash[:success] = "The super potin was successfully saved!"
      redirect_to gossips_path
    else
      flash.now[:error] = @gossip.errors.full_messages.to_sentence
      render :new
    end

end

private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
  
end
