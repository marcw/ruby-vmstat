module Vmstat
  # Gathered cpu performance statistics snapshot.
  # @attr [Integer] num
  #   The number of the cpu starting at 0 for the first cpu.
  # @attr [Integer] user
  #   Current counter of ticks spend in user. The counter can overflow.
  # @attr [Integer] system
  #   Current counter of ticks spend in system. The counter can overflow.
  # @attr [Integer] nice
  #   Current counter of ticks spend in nice. The counter can overflow.
  # @attr [Integer] idle
  #   Current counter of ticks spend in idle. The counter can overflow.
  class Cpu < Struct.new(:num, :user, :system, :nice, :idle)
  end
end
