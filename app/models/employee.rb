class Employee < ApplicationRecord
  after_commit { EmployeesChannel.broadcast_to('list', Employee.all) }
end
