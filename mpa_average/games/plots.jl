module Plots
  export display_plots

  using PyPlot;


  function display_plots(RESULTS_1, RESULTS_2, Markov_a, Chebyshev_a)

    figure(1);
    plt[:hist](RESULTS_1,length(select_distinct(RESULTS_1)), color="#0f87bf",alpha=0.4)
    xlabel("Game outcome");
    ylabel("Number of trials giving specified outcome");
    title("Histogram");
    grid("on");

    figure(2);
    plt[:hist](RESULTS_2, length(select_distinct(RESULTS_2)), color="#0f87bf",alpha=0.4)
    xlabel("Game outcome");
    ylabel("Number of trials giving specified outcome");
    title("Histogram");
    grid("on");
    
    println("Game 1:");
    println("Mean: "*string(mean(RESULTS_1)));
    println("Max: "*string(maximum(RESULTS_1)));
    println("Min: "*string(minimum(RESULTS_1)));
    println("Var: "*string(var(RESULTS_1)));

    println("Game 2:");
    println("Mean: "*string(mean(RESULTS_2)));
    println("Max: "*string(maximum(RESULTS_2)));
    println("Min: "*string(minimum(RESULTS_2)));
    println("Var: "*string(var(RESULTS_2)));

  end;

  function select_distinct(vector::Vector)
    result = zeros(0);
    for a in vector
      if !vec_contains(result, a)
        append!(result, [a]);
      end;
    end;
    return result;
  end;

  function vec_contains(vector::Vector, a)
    for v in vector
      if v==a
        return true;
      end;
    end;
    return false;
  end;


end
