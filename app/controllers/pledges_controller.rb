class PledgesController < ApplicationController
    before_action :authorize
    
    def index 
        render json: Pledge.all
    end

    def show 
        render json: find_campaign
    end

    def create
        user = User.find(session[:user_id])
        pledge = user.pledges.create!(pledge_params )
        pledge.campaign.update(current_amount:pledge.campaign.current_amount+pledge.pledge_amount)
        render json: pledge, status: :created
    end 

    def update 
        pledge = find_pledge
        pledge.update!(pledge_params )
        render json: pledge, status: :ok
    end 

    def destroy
        pledge = find_pledge
        pledge.destroy
        head :no_content 
    end 

    private 

    def find_pledge
        Pledge.find_by(id: params[:id])
    end 

    def pledge_params 
        params.permit(:pledge_amount, :campaign_id)
    end
end
