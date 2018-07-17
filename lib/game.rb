class Game
    require_relative "player.rb"
    require_relative "board.rb"
    
    
    
    def initialize
        @player1 = Player.new(player_name(1))
        @player2 = Player.new(player_name(2))
        @current_player = @player2

        @selected_values = []

        @board = Board.new

        @game_on = true
        play_game
    end
    private
    def player_name(num)
        puts "Bonjour, joueur numero #{num}, quel est votre prenom ?"
        gets.chomp
    end

    def play_game
        while @game_on
            puts "A vous, #{@current_player.name}"
            cell = gets.chomp.to_sym.downcase

            while cell.match(/[^a-c1-3]/) || @selected_values.include?(cell)
                puts "Position deja prise ou invalide"
                cell = gets.chomp.to_sym
            end
            @selected_values << cell

            @board.select(cell)
            @board.drawBoard
            @board.check_board
            if @board.win
                puts "Le vainqueur est #{@current_player.name} ! Bravo."
                exit
            elsif @board.draw
                puts "Match Nul !" 
                exit
            end
            switch_cur_player

        end   
        

    end

    def switch_cur_player
        @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    end
end

newGame = Game.new