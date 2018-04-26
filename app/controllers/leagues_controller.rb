class LeaguesController < ApplicationController
    def index
        @ongoing_leagues = League.where(winner_id: nil)
        @completed_leagues = League.where.not(winner_id: nil)
    end 

    def show
        @league = League.find(params[:id])
    end 

    def new
        @league = League.new
    end 


    # ------------ CRUD Actions
    def create
        league = League.new(league_params)
        league.owner_id = current_user.id
        league.save

        redirect_to leagues_path
    end 

    private 

    def league_params
        params.require(:league).permit(
            :name,
            :owner_id
        )
    end 
end