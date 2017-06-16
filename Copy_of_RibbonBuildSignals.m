function Signals = Copy_of_RibbonBuildSignals(Ribbon, P, Signal, sf)
  %% Compute the delay for each actuator position
  Dy = Ribbon.Actuator.y - P;   % P is the position of the actuator
  %Dy = sqrt(Dy.^2+Dx.^2);      % redundant b/c 1 dimensional
  Dt = Dy/Ribbon.v;             % 
  Dt = max(Dt) - Dt;
  n = round(Dt*sf);
  dn = length(Signal);          % samples signal

  M       = max(n)+dn ;
  N       = length(Dy); 
  Signals = zeros(M+1,N);

  for i=1:N
    Signals(n(i)+1:n(i)+dn,i) = Signal;
  end
 
  
  