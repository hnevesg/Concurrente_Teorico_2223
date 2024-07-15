with Text_IO;
with pkg_tarea; use pkg_tarea;


procedure exercise3 is
--In this program, two different tasks of the same type are created and it is shown their execution time
--and after 8 seconds, they are aborted and 2 seconds later, the program comes to its end.
	instanceTask1 : tarea_periodica_t; --first instance of the task type specified
	instanceTask2 : tarea_periodica_t; --second instantce of the task type specified
begin  --beginning of main- tasks time displayed

	Text_IO.Put_Line("*****Beginning of the program*****");
	delay 8.0; --after delaying 8 secs
	abort instanceTask1; --abort task1
	abort instanceTask2; --abort task2
	delay 2.0; --wait 2 secs until showing end of the program message
  	 Text_IO.Put_Line("*****End of the program...*****");

end exercise3; --end
