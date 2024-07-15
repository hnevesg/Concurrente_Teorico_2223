with Ada.Task_Identification; use Ada.Task_Identification;
with Ada.Real_Time; use Ada.Real_Time;
with Text_IO;

--In this package we have the task body creation for tarea_periodica_t:
--The producedure asked in the exercise statement is followed in the asked order.
--First, we create the necessary variables and after the task body is implemented
--Each step of the task body is documented in its code below.
package body pkg_tarea is
   --Time_Span permits us use time durations, specifying the asked constants with Ada.Real_Time
   activationTime : constant Time_Span := Seconds(1); -- one second
   period : constant Time_Span := Milliseconds(2000); -- 2000 milliseconds
   executionTime : constant Time_Span := Milliseconds(1000); -- 1000 milliseconds
   initEjecucion : Time; --time variable to store time instant for clock
   counterActiveWaiting : Integer; --active waiting (increases by time)
	
	
	task body tarea_periodica_t is
	begin --beginning of the task 
      		delay To_Duration(activationTime); --we wait for the activation time
		
      loop
         initEjecucion := Clock; --use clock function to take time instant
         counterActiveWaiting := 0;
         -- while the running time is less than the execution time
         while (To_Duration(Clock-initEjecucion)<To_Duration(executionTime)) loop
            counterActiveWaiting := counterActiveWaiting + 1; --activate waiting integer counter plus one.
         end loop;
         --once the task ends its execution, we check if it works correctly with the info given:
         Text_IO.Put_Line( "Task("&Image(Current_Task)&"):Integer variable (active waiting): " & Integer'Image(counterActiveWaiting));
         --delay to ensure the task is activated periodically (calculate activation time)
         delay until (initEjecucion+period); 
         Text_IO.New_Line; --print empty line for better visualisation
      end loop;
      
	end tarea_periodica_t; --end task
end pkg_tarea;
