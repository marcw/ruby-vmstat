module Vmstat
  # Gathered disk statistics snapshot.
  # @attr [Symbol] type
  #   The file system name e. g. *hfs*.
  # @attr [String] origin
  #   The location of the device e.g. */dev/disk0*.
  # @attr [String] mount
  #   The mount point of the device e.g. */mnt/store*.
  # @attr [Integer] block_size
  #   Size of file system blocks in bytes.
  # @attr [Integer] free_blocks
  #   Free blocks in the file system.
  # @attr [Integer] available_blocks
  #   Available blocks in the file system.
  # @attr [Integer] total_blocks
  #   Total number of blocks in the file system.
  class Disk < Struct.new(:type, :origin, :mount, :block_size, 
                          :free_blocks, :available_blocks, :total_blocks)

    # Calculates the number of free bytes for the file system.
    # @return [Integer] number of free bytes
    def free_bytes
      free_blocks * block_size
    end

    # Calculates the number of available bytes for the file system.
    # @return [Integer] number of available bytes
    def available_bytes
      available_blocks * block_size
    end

    # Calculates the number of used bytes for the file system.
    # @return [Integer] number of used bytes
    def used_bytes
      (total_blocks - free_blocks) * block_size
    end

    # Calculates the number of total bytes for the file system. This is the max.
    # number of bytes possible on the device.
    # @return [Integer] number of total bytes
    def total_bytes
      total_blocks * block_size
    end
  end
end
