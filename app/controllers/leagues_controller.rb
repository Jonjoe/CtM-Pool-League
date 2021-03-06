class LeaguesController < ApplicationController
    before_action :require_login
    
    # ------------ Template Methods    
    def index
        @title = "Leagues"        

        @your_leagues =  League.where(owner_id: current_user.id).where(archived: false)

        @ongoing_leagues = League.where(winner_id: nil).where(archived: false)
        @completed_leagues = League.where.not(winner_id: nil).where(archived: false)

        @archived_leagues = League.where(archived: true)
    end 

    def show
        @league = League.find(params[:id])
        @title = @league.name               
    end  

    def new
        @title = "Start a new league"
        @league = League.new
    end 


    # ------------ CRUD Actions
    def create
        league = League.new(league_params)
        league.owner_id = current_user.id
        league.save

        redirect_to league_path(league)
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