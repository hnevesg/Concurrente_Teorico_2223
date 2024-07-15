with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with pkg_tareas; use pkg_tareas;

package body pkg_tareas is
     Hyperperiod : constant Time_Span := Milliseconds(100); --lcm of all periods
     Task_Start : Time;

   procedure A is
    Task_Duration : Time_Span := Milliseconds(10); --worst case
   begin
         Task_Start := Clock;
         delay until Task_Start + Task_Duration;
         if Clock - Task_Start >= Hyperperiod then
         Put_Line("Task A aborted due to timeout");
         return;
	end if;
         Put_Line("Task A completed");
   end A;

  procedure B is
    Task_Duration : Time_Span := Milliseconds(8);
   begin
         Task_Start := Clock;
         delay until Task_Start + Task_Duration;
	if Clock - Task_Start >= Hyperperiod then
         Put_Line("Task B aborted due to timeout");
         return;
	end if;
         Put_Line("Task B completed");
   end B;

  procedure C is
    Task_Duration : Time_Span := Milliseconds(5);
   begin
         Task_Start := Clock;
         delay until Task_Start + Task_Duration;
         if Clock - Task_Start >= Hyperperiod then
         Put_Line("Task C aborted due to timeout");
         return;
	end if;
         Put_Line("Task C completed");
   end C;

  procedure D is
    Task_Duration : Time_Span := Milliseconds(4);
   begin
         Task_Start := Clock;
         delay until Task_Start + Task_Duration;
         if Clock - Task_Start >= Hyperperiod then
         Put_Line("Task D aborted due to timeout");
         return;
	end if;
         Put_Line("Task D completed");
   end D;

  procedure E is
    Task_Duration : Time_Span := Milliseconds(2);
   begin
         Task_Start := Clock;
         delay until Task_Start + Task_Duration;
         if Clock - Task_Start >= Hyperperiod then
         Put_Line("Task E aborted due to timeout");
         return;
	end if;
         Put_Line("Task E completed");
   end E;
   
end pkg_tareas;


