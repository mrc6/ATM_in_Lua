local Account = {
  balance = 0,
  history = {}
}

function Account:new(o)
  local obj = o or {}
  setmetatable(obj, self)
  self.__index = self
  self.history.__index = self
  return obj
end
  
function Account:deposit(amount, history)
  self.balance = self.balance + amount
  self.history = history
  table.insert(self.history, 'Deposit of '..amount)
end
  
function Account:withdraw(amount, history)
  if self.balance < amount then
    print("Not enought funds. Transfer not realized.")
    return
  end
  self.balance = self.balance - amount
  self.history = history
  table.insert(self.history, 'Withdraw of '..amount)
end
  
function Account:transfer(to_account, amount, history, to_account_history)
  if self.balance < amount then
    print("Not enought funds. Transfer not realized.")
    return
  end
  self.balance = self.balance - amount
  self.history = history
  to_account.history = to_account_history
  table.insert(self.history, 'Transfer of '..amount..' send')
  to_account.balance = to_account.balance + amount
  table.insert(to_account.history, 'Transfer of '..amount..' received')
end

return Account
