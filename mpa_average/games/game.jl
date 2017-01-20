module Games
  export Game, play

  type Game
    rounds::Int64
    win::Float64
    loss::Float64
  end

  function play(game::Game)
    wins = 0;
    loses = 0;
    for i=1:game.rounds
      if(rand()>=0.5)
        wins+=1;
      else
        loses+=1;
      end;
    end;
    return wins*game.win+loses*game.loss;
  end;
end
