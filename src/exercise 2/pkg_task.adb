with Text_IO; use TEXT_IO;
with pkg_procedure; use pkg_procedure;
with pkg_task; use pkg_task;

package body pkg_task is
	task body tarea_t is
		Even: Integer := 0; -- even numbers counter
		Odd: Integer := 0; -- odd numbers counter
	begin	-- beginning of tarea_t
	loop
		accept EstadoConsultas do -- EstadoConsultas entry code: print the total number of even/odd numbers consulted
			Put_Line("The number of even numbers consulted is " & Integer'Image(Even));
			Put_Line("The number of odd numbers consulted is " & Integer'Image(Odd));
		end EstadoConsultas; -- end of EstadoConsultas entry

		accept EsPar(n: Integer) do -- EsPar entry code: check if the number introduced is even or odd
			if n mod 2 = 0 then -- check if even
				Even := Even+1; -- increment by 1 the even numbers counter
				Put_Line("The number " & Integer'Image(n) &" is Even");
			else -- if not even, it is odd
				Odd := Odd+1; -- increment by 1 the odd numbers counter
				Put_Line("The number "& Integer'Image(n)&" is Odd");
			end if;
		end EsPar; -- end of EsPar entry
		
	end loop;
	end tarea_t; -- end of tarea_t
end pkg_task;	


