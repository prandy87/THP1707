class Board
    @@lines = [@@line1 = {:a1 => ' ', :b1 => ' ', :c1 => ' '},
              @@line2 = {:a2 => ' ', :b2 => ' ', :c2 => ' '},
              @@line3 = {:a3 => ' ', :b3 => ' ', :c3 => ' '}]

    def initialize
        puts "Initialisation des joueurs et du jeu"
        @win = false
        @draw = false
        @@turn = 1
        display
    end
    private
    def display 
        puts "*** Jeu du MORPION ! ***"
        puts "Lignes : A, B, C"        
        puts "Colonnes : 1, 2, 3"
        puts "Entrez une ligne et une colonne"
    
        puts "EXEMPLE: A3"
        puts "*********************"
        drawBoard
    end
    public
    def drawBoard
        
            puts "********************"
            puts "Tour numero #{@@turn}"
            puts "     A    B    C    "
            puts "   --------------  "
            puts "1 | #{@@line1[:a1]}  | #{@@line1[:b1]}  | #{@@line1[:c1]}  |          "
            puts "   --------------  "
            puts "2 | #{@@line2[:a2]}  | #{@@line2[:b2]}  | #{@@line2[:c2]}  |          "
            puts "   --------------  "
            puts "3 | #{@@line3[:a3]}  | #{@@line3[:b3]}  | #{@@line3[:c3]}  |          "
    
        
    end
    public
    def select(cell)
        @@lines.each do |row|
            row.each do |key, value|
                if key == cell && value == " "
                    @@turn.odd? ? row[key] = "X" : row[key] = "O"
                    @@turn += 1
                end
            end
        end
    end
    public
    def check_board
        x_wins = ["X", "X", "X"]
        o_wins = ["O", "O", "O"]

        winning_lines = [            
            [@@line1[:a1],@@line2[:a2],@@line3[:a3]],
			[@@line1[:b1],@@line2[:b2],@@line3[:b3]],
			[@@line1[:c1],@@line2[:c2],@@line3[:c3]],
			[@@line1[:a1],@@line1[:b1],@@line1[:c1]],
			[@@line2[:a2],@@line2[:b2],@@line2[:c2]],
			[@@line3[:a3],@@line3[:b3],@@line3[:c3]],
			[@@line1[:a1],@@line2[:b2],@@line3[:c3]],
			[@@line3[:a3],@@line2[:b2],@@line1[:c1]]     
        ]
        winning_lines.each do |check|
            if check == x_wins || check == o_wins
                @win = true
            end

            if @@turn >= 9 
                @draw = true
            end
    end
    
    def win
        @win
    end  
    
    def draw
        @draw
    end 


end



end