class EmployeesChannel < ApplicationCable::Channel

  def subscribed
    stream_for 'list'
  end

end