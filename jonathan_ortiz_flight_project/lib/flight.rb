class Flight
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    attr_reader :passengers

    def full?
        return @capacity == @passengers.length
    end

    def board_passenger(passenger)
        @passengers << passenger if !self.full? && passenger.has_flight?(@flight_number)
    end

    def list_passengers
        result = []
        @passengers.each {|passenger| result << passenger.name}
        return result
    end

    def [](num)
        return @passengers[num]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end