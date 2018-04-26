class GamesController < ApplicationController
    # ------------ Template Methods    
    def index
        @games = Game.all
    end 

    def show
        @game = Game.find(params[:id])
    end 
    
    def new
        @league = League.find(params[:league_id])
        @users = User.where.not(role: "admin")
        @game = Game.new
    end 

    # ------------ CRUD Actions
    def create
        game = Game.new(game_params)
        game.league_id = params[:league_id]
        game.save

        redirect_to league_path(params[:league_id])
    end

    def update
    end
    
    def destroy
        game = Game.find(params[:id])
        game.destroy
        
        redirect_to league_path(params[:league_id])
    end

    # ------------ Bespoke Actions

    private 

    def game_params
        params.require(:game).permit(
            :name,
            :winner_id,
            :player1_id,
            :player2_id,
            :league_id,
        )
    end 
end
