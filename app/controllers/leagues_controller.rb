class LeaguesController < ApplicationController
    # ------------ Template Methods    
    def index
        @ongoing_leagues = League.where(winner_id: nil).where(archived: false)
        @completed_leagues = League.where.not(winner_id: nil).where(archived: false)

        @archived_leagues = League.where(archived: true)
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

    # ------------ Bespoke Actions
    def archive
        league = League.find(params[:league_id])
        league.archived = true
        league.save
        
        redirect_to league_path(league)
    end 

    def close
        league = League.find(params[:league_id])
        league.assign_winner

        league.games.where(winner_id: nil).destroy_all
        
        redirect_to league_path(league)
    end 

    private 

    def league_params
        params.require(:league).permit(
            :name,
            :archive,
            :owner_id
        )
    end 
end