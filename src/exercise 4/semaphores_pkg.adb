with semaphores_pkg ; use semaphores_pkg;
package body semaphores_pkg is
    protected body semaphore_t is
		-- it is a binary semaphore, the possible values are 0 & 1
		entry wait when value_sem = 1 is
		begin
			value_sem := 0;
		end wait;
		
		procedure signal is
		begin
			value_sem := 1; 
		end signal;
    end semaphore_t;
    
    	procedure wait(x: in out semaphore_t) is
	begin
		x.wait;
	end wait;

	procedure signal(x: in out semaphore_t) is
	begin
		x.signal;
	end signal;

end semaphores_pkg;
