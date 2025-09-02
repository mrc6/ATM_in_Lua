local History = require('history_class')
local Account = require('account_class')
  
--Test
local john_history = History:new()
local doe_history = History:new()
local john = Account:new()
local doe = Account:new()
  
john:deposit(500,john_history)
doe:deposit(10,doe_history)
john:transfer(doe, 1000, john_history, doe_history)
john:transfer(doe, 50, john_history, doe_history)
john:withdraw(40, john_history)
john:withdraw(10, john_history)
doe:withdraw(10, doe_history)
  
print('John balance is '..john.balance)
print('Doe balance is '..doe.balance)
  
print('John account history')
for index, value in ipairs(john.history) do
    print(value)
end

print('Doe account history')
for index, value in ipairs(doe.history) do
    print(value)
end
