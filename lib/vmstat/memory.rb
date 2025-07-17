module Vmstat
  # Gathered memory data snapshot.
  # @attr [Integer] pagesize
  #   The page size of the memory in bytes.
  # @attr [Integer] wired
  #   The number of wired pages in the system.
  # @attr [Integer] active
  #   The number of active pages in the system.
  # @attr [Integer] inactive
  #   The number of inactive pages in the system.
  # @attr [Integer] free
  #   The number of free pages in the system.
  # @attr [Integer] pageins
  #   The number of pageins.
  # @attr [Integer] pageouts
  #   The number of pageouts.
  class Memory < Struct.new(:pagesize, :wired, :active, :inactive, :free,
                            :pageins, :pageouts)
    # Calculate the wired bytes based of the wired pages.
    # @return [Integer] wired bytes
    def wired_bytes
      wired * pagesize
    end

    # Calculate the active bytes based of the active pages.
    # @return [Integer] active bytes
    def active_bytes
      active * pagesize
    end

    # Calculate the inactive bytes based of the inactive pages.
    # @return [Integer] inactive bytes
    def inactive_bytes
      inactive * pagesize
    end

    # Calculate the free bytes based of the free pages.
    # @return [Integer] free bytes
    def free_bytes
      free * pagesize
    end

    # Calculate the total bytes based of all pages
    # @return [Integer] total bytes
    def total_bytes
      (wired + active + inactive + free) * pagesize
    end
  end

  # @attr [Integer] available
  #   The estimated available memory (linux)
  #   See: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=34e431b0ae398fc54ea69ff85ec700722c9da773
  class LinuxMemory < Memory
    attr_accessor :available

    # Calculate the available bytes based of the active pages.
    # @return [Integer] active bytes
    def available_bytes
      available * pagesize
    end
  end
end
