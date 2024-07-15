package Pot is
        
     type TState is (EMPTY, FILLED); --type with states of the pot
 
   protected type PotFood(Pot_State: TState := FILLED) is --constructor with the entries and the state
      entry Serve; --serve ration
      entry NotifyNoFood; --notify that pot is empty 
      entry Fill; --fill ration
   private
      State: TState := Pot_State; --state of the pot
 end PotFood;
   
   procedure Serve(Food: in out PotFood); --procedure to serve a ration of the pot
   procedure Fill(Food: in out PotFood); --procedure to fill the pot when empty 
   procedure NotifyNoFood(Food: in out PotFood); --procedure to notify pot is empty

end Pot;
