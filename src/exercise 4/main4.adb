with Text_IO; use Text_IO;
with semaphores_pkg; use semaphores_pkg;
with Ada.Text_IO; use Ada.Text_IO;

procedure main is
   sem : semaphore_t;

begin
   
   semaphores_pkg.signal(sem);  
   Put_Line("Semaphore released");
   
   wait(sem);
   Put_Line("Semaphore acquired again");
   
   signal(sem);
   Put_Line("Semaphore released again");
end main;


