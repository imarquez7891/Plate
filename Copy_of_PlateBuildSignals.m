function Signals = PlateBuildSignals(Plate, P, Signal, sf)
  %% Compute the delay for each actuator position
  Dx = Plate.Actuator.x - P(1); 
  Dy = Plate.Actuator.y - P(2);

  Dt = sqrt(Dx.^2+Dy.^2) / Plate.v;

  Dt = max(Dt) - Dt;

  n  = round(Dt*sf)  ; % samples per delay
  dn = length(Signal); % samples signal

  M       = max(n)+dn ;
  N       = length(Dx); 
  Signals = zeros(M,N);

  for i=1:N
    %fprintf('%4d, %4d\n',n(i)+1,n(i)+dn);
    Signals(n(i)+1:n(i)+dn,i) = Signal;
  end
