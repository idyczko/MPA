include("plots.jl");
include("game.jl")
using Plots;
using Games;

Markov_a = 2; #Coefficient a (will be multiplied by expected value)
Chebyshev_a = 2; #Coefficient a (will be multiplied by standard deviation)

game_1 = Game(5, 11,-110);
game_2 = Game(1100, 0.05, -0.5);

attempts=1000000;
RESULTS_1=zeros(attempts);
RESULTS_2=zeros(attempts);


for a = 1:attempts
  RESULTS_1[a]=play(game_1);
  RESULTS_2[a]=play(game_2);
end;

Plots.display_plots(RESULTS_1, RESULTS_2, Markov_a, Chebyshev_a);
