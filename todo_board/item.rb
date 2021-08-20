class Item
    def self.valid_date?(date)
        nums = date.split("-")
        year = nums[0].to_i
        month = nums[1].to_i
        day = nums[2].to_i
        return false if (year < 0)
        return false if (month < 1) || (month > 12)
        return false if (day < 1) || (day > 31)
        return true
    end

    def initialize(title, deadline, description)
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "invalid deadline format"
        end
        @title = title
        @description = description
        @done = false
    end

    attr_accessor :title, :description
    attr_reader :deadline
    attr_reader :done

    def deadline=(new_deadline)
        @deadline = new_deadline if Item.valid_date?(new_deadline)
    end

    def toggle
        @done = !@done
    end

end