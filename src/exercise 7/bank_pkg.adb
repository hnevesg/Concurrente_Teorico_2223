with ADA.Text_IO; use ADA.Text_IO;
with Text_IO; use Text_IO;

package body bank_pkg is
    protected body account_t is

	entry withdraw(quantity: in Integer) when value_money>0 is
	begin
	if value_money >= quantity then
		value_money := value_money - quantity;
		Put_Line("Withdraw done. Remaining money:" & value_money'Image);
	else
		Put_Line("Not enough money to withdraw" & quantity'Image & "€");
	end if;	
	end withdraw;
	
	entry deposit(quantity: in Integer) when True is
	begin
		value_money := value_money + quantity;
		Put_Line("Deposit done. Updated money:" & value_money'Image); 
	end deposit;
		
	entry transfer(quantity: in Integer; destination: account_t_access) when value_money>0 is
	begin
		if value_money >= quantity then
		value_money := value_money - quantity;
		destination.all.deposit(quantity);
		Put_Line("Transfer done!");
		else
		Put_Line("Not enough money to transfer" & quantity'Image & "€");
		end if;
	end transfer;
	
	procedure balance_query is
	begin
		Put_Line("Current balance:" & value_money'Image & "€");
	end balance_query;
    end account_t;
    
    procedure withdraw(quantity: in out Integer; account: in out account_t) is
	begin
		account.withdraw(quantity);
	end withdraw;
	
	procedure deposit(quantity: in out Integer; account: in out account_t) is
	begin
		account.deposit(quantity);
	end deposit;
	
	procedure transfer(quantity: in Integer; source: in out account_t; destination: in out account_t_access) is
	begin
		source.transfer(quantity, destination); 
	end transfer;
	
	procedure balance_query(account: in out account_t) is
	begin
		account.balance_query;
	end balance_query;	

end bank_pkg;
