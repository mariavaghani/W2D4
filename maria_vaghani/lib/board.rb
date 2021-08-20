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
        if stack_idx < 0 || stack_idx >= @stacks.length
            return false
        end
        if @stacks[stack_idx].length < @max_height
            @stacks[stack_idx].push(token)
            return true
        else
            return false
        end
    end

    def vertical_winner?(token)
        return true if @stacks.any? { |stack| stack.all?(token) && stack.length == @max_height }
        false
    end

    def horizontal_winner?(token)

        (0...@max_height).each do |row_index|
            return true if (0...@stacks.length).all? { |stack_idx| @stacks[stack_idx][row_index] == token }
        end
        # return true if (0...@stacks.length).all? { |stack_idx| (0...@max_height).any?{|pos_id| @stacks[stack_idx][pos_id] == token } }
        false
    end


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| puts stack.join(" ") }
    end

    def winner?(token)
        horizontal_winner?(token) || vertical_winner?(token)
    end
end
