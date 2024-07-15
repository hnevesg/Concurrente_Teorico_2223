package body Pot is
 
  protected body PotFood is --body of the pot shared object

      entry Serve when State = FILLED is
       begin
        State := FILLED;
       end Serve;
           
      entry Fill when State = EMPTY is
       begin
        State := FILLED;
      end Fill;
      
      entry NotifyNoFood when State = FILLED is
      begin
         State := EMPTY;
      end NotifyNoFood;
   end PotFood;
  

  procedure Serve(Food: in out PotFood) is
   begin
       Food.Serve;
    end Serve;

  procedure Fill(Food: in out PotFood) is
    begin
       Food.Fill;
   end Fill;
   
   procedure NotifyNoFood(Food: in out PotFood) is
   begin 
      Food.NotifyNoFood;
   end NotifyNoFood;
end Pot;
