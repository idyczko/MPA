include("plots.jl");
using Plots;
using StatsBase;
using PyPlot;

Markov_a = 2; #Coefficient a (will be multiplied by expected value)
Chebyshev_a = 2; #Coefficient a (will be multiplied by standard deviation)

attempts=10000;
range = 100;
offset = 50;
RESULTS_AVR=zeros(attempts);
RESULTS_GEO=zeros(attempts);
RESULTS_HAR=zeros(attempts);

V = zeros(0);#[convert(Integer,round(rand()*range+offset))];
for a = 1:attempts
  if a==attempts/2
    offset*=4;
  end;
  if rand()<=0.005
      append!(V, [1000*convert(Integer,round(rand()*range+offset))])
  else
      append!(V, [convert(Integer,round(rand()*range+offset))])
  end;
  RESULTS_AVR[a]=mean(V);
  RESULTS_GEO[a]=geomean(V);
  RESULTS_HAR[a]=harmmean(V);
end;
plot(1:length(RESULTS_AVR), RESULTS_AVR, "r-");
plot(1:length(RESULTS_GEO), RESULTS_GEO, "g-")
plot(1:length(RESULTS_HAR), RESULTS_HAR, "b-")
#Plots.display_plots(RESULTS_1, RESULTS_2, Markov_a, Chebyshev_a);
