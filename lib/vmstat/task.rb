module Vmstat
  # Per task performance metrics snapshot.
  # @attr [Integer] virtual_size
  #   The number of virtual pages for the task.
  # @attr [Integer] resident_size
  #   The number of resident pages for the task
  # @attr [Integer] user_time_ms
  #   The total user run time for terminated threads within the task.
  # @attr [Integer] system_time_ms
  #   The total system run time for terminated threads within the task.
  class Task < Struct.new(:virtual_size, :resident_size,
                          :user_time_ms, :system_time_ms)
  end
end
