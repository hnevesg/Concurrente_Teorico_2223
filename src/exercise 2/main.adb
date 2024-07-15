with Text_IO; use TEXT_IO;
with pkg_procedure; use pkg_procedure;
with pkg_task; use pkg_task;

procedure main is 
		myTask: tarea_t; --task to manage
		n: Integer; -- number to manage
	begin
		while true loop
			myTask.EstadoConsultas; -- consult total even/odd numbers consulted
			Leer_Entero(n); -- read by stdin a number for the exercise operations
			if n /= 0 then -- if it is not 0, check with EsPar if the number is even or odd
				myTask.EsPar(n);
			else	-- if 0 is introduced, abort the task and exit the program
				exit;
			end if;
		end loop;
	abort myTask;
	end main;


