with Ada.Text_IO; use Ada.Text_IO;
with bank_pkg; use bank_pkg;

procedure Main is

   acc1 : account_t;
   acc2 : account_t_access := new account_t;
   w : Integer := 100;
   z : Integer := 5;
   begin
	balance_query(acc1);

        -- Deposit
      deposit(quantity => w, Account => acc1);

      -- Transfer
      transfer(quantity => z, source => acc1, destination => acc2);
       
       -- Withdraw
      withdraw(quantity => w, Account => acc1);
      
      -- Balance Query
      balance_query(acc1);
      
   end Main;

