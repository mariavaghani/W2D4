class Board

    attr_reader :max_height

    def self.build_stacks(num_of_stacks)
        Array.new(num_of_stacks) {[]}
    end

    def initialize(num_of_stacks, max_height)
        @max_height = max_height
        @stacks = Board.build_stacks(num_of_stacks)
        if num_of_stacks < 4 || max_height < 4
            raise "rows and cols must be >= 4"
        end
    end

    def add(token, stack_idx)
        if @stacks[stack_idx].length < @max_height
            @stacks[stack_idx].push(token)
            return true
        else
            return false
        end
    end

    def method_name
        
    end


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
