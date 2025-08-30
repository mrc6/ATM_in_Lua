local Account = {
  balance = 0,
  history = {}
}

function Account:new(o)
  local obj = o or {}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Account:deposit(amount)
  self.balance = self.balance + amount
  table.insert(self.history, 'Deposit of '..amount)
end

function Account:withdraw(amount)
  if self.balance < amount then
    print("Not enought funds. Transfer not realized.")
    return
  end
  self.balance = self.balance - amount
end

function Account:transfer(to_account, amount)
  if self.balance < amount then
    print("Not enought funds. Transfer not realized.")
    return
  end
  
  self.balance = self.balance - amount
  table.insert(self.history, 'Transfer of '..amount..' send')
  to_account.balance = to_account.balance + amount
  table.insert(to_account.history, 'Transfer of '..amount..' received')
end

--Test

local john = Account:new()
local doe = Account:new()

john:deposit(500)
doe:deposit(10)
john:transfer(doe, 1000)
john:transfer(doe, 50)
john:withdraw(40)
john:withdraw(10)
doe:withdraw(10)

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


