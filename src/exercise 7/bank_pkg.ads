
package bank_pkg is
	type account_t is limited private;
	type account_t_access is access all account_t;
	--the three operations & query
	procedure withdraw(quantity: in out Integer; account: in out account_t);
	procedure deposit(quantity: in out Integer; account: in out account_t);
	procedure transfer(quantity: in Integer; source: in out account_t; destination: in out account_t_access);
	procedure balance_query(account: in out account_t);
	
	private
          protected type account_t(balance: Integer := 0) is--sobra balance?
		entry withdraw(quantity: in Integer);
		entry deposit(quantity: in Integer);
		entry transfer(quantity: in Integer; destination: account_t_access);
		procedure balance_query;
		private
		value_money: Integer := balance;
	end account_t;	
end bank_pkg;



