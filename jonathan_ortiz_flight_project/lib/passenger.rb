class Passenger
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    attr_reader :name

    def has_flight?(str)
        return @flight_numbers.include?(str.upcase)
    end

    def add_flight(str)
        @flight_numbers << str.upcase if !self.has_flight?(str)
    end

end