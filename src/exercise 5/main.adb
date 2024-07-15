with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with pkg_tareas; use pkg_tareas;

procedure Main is

   Hyperperiod_Start : Time := Clock;
   Hyperperiod : constant Time_Span := Milliseconds(103); --lcm of all periods
   Secondary_Period : constant Time_Span := Milliseconds(10);
   counter : Integer := 1;   
   type cycle is mod 4; 
   frame : cycle := 0;
  
     procedure Get_Procedure(Parameter : character) is
begin
  case Parameter is
    when 'A' =>
      A;
    when 'B' =>
      B;
    when 'C' =>
     C;
    when 'D' =>
     D;
    when 'E' =>
     E;
    when others =>
     null;
   end case;
end Get_Procedure;
  
    procedure Check_Time(Task_Name: character) is
   begin
      if Clock - Hyperperiod_Start >= Hyperperiod then
       Put_Line("Task " & Task_Name & " aborted due to timeout");
         return;
      end if;
      Get_Procedure(Task_Name);
   end Check_Time;
   

   
begin
     
   loop
    case frame is
	 when 0 => Check_Time('A'); 
   		   Check_Time('B'); 
	  	   Check_Time('C');  
		   Check_Time('E'); 
         when 1 => Check_Time('A'); 
		   Check_Time('B'); 
         	   Check_Time('D'); 
         when 2 => Check_Time('A');
		   Check_Time('B'); 
          	   Check_Time('C');
         when 3 => Check_Time('A');
                   Check_Time('B'); 
          	   Check_Time('D');
    end case;
   Put_Line("Frame" & Integer'Image(counter) & " ended");
   counter := counter+1;
   frame := frame+1;
      exit when Clock - Hyperperiod_Start >= Hyperperiod;
   end loop;

end Main;


