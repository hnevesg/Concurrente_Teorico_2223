with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Pot; use Pot;

procedure exercise6 is

   TOTAL_RATIONS : constant Natural := 20;
   Counter_Rations : Natural := TOTAL_RATIONS;
   type PPot is access all PotFood;

   -- Savage task type
   task type Savage(Id: Natural; Food: PPot);
   task body Savage is --body
   begin
      loop
         while Counter_Rations > 0 loop --serve the rations until there are not anymore
             Put_Line("The savage with ID:" & Id'Image & Counter_Rations'Image & " is eating a ration!");
         --    Food.Serve;
            Counter_Rations := Counter_Rations - 1;
            delay 1.0;
         end loop;
      end loop;
   end Savage;

   -- Cook task
   task type Cook(Food: Ppot);
   task body Cook is
   begin
      loop
         if Counter_Rations = 0 then --when empty, fill the pot
           -- Food.NotifyNoFood;
            Put_Line("The pot is empty, it will be filled now!");
            delay 2.0; --the action of filling the pot
           -- Food.Fill;
            Counter_Rations := TOTAL_RATIONS; --the same pot as in savages
       end if;
      end loop;
   end Cook;

   -- Number of savages
   Num_Savages : Natural;

begin
   -- Get the number of savages from the user
   Put("Enter the number of savages: ");
   Get(Num_Savages); --no controlamos si mete un 0
   New_Line;

   declare
   -- Create the pot object
   --Pot_Object : aliased Pot.PotFood; 
   Pot_Object: Ppot;

   -- Create the array of savage tasks
   type Savage_Access is access all Savage;
   Savages : array(1..Num_Savages) of Savage_Access;

	--Cook_Task : Cook(Food => Pot_Object'Access);
	Cook_Task : access Cook;


begin
   -- Start the cook task
	Cook_Task := new Cook(Food => Pot_Object);
   -- Create the savage tasks
   for I in 1..Num_Savages loop
      Savages(I) := new Savage(Id => I, Food => Pot_Object);
   end loop;
   end;
end exercise6;



