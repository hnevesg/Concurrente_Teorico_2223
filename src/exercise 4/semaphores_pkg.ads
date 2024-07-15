
package semaphores_pkg is
	type semaphore_t is limited private;
	-- the two operations a semaphore can do
	procedure wait(x: in out semaphore_t);
	procedure signal(x: in out semaphore_t);
	private
          protected type semaphore_t(sem_state: integer := 0) is
		entry wait; -- is an entry because if sem=0 the process is blocked
		procedure signal;
	private
		value_sem: integer := sem_state;
	end semaphore_t;	
end semaphores_pkg;

