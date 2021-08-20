require_relative "./list.rb"

class TodoBoard
    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when "mktodo"
            @list.add_item(*args)
        when "up"
            if args[1]
                @list.up(args[0].to_i, args[1].to_i)
            else
                @list.up(args[0].to_i)
            end
        when "down"
            if args[1]
                @list.down(args[0].to_i, args[1].to_i)
            else
                @list.down(args[0].to_i)
            end
        when "swap"
            @list.swap(args[0].to_i, args[1].to_i) 
        when "sort"
            @list.sort_by_date
        when "priority"
            @list.print_priority
        when "print"
            if args.length == 0
                @list.print_list
            else
                @list.print_full_item(args[0].to_i)
            end
        when "toggle"
            @list.toggle_item(args[0].to_i)
        when "rm"
            @list.remove_item(args[0].to_i)
        when "purge"
            @list.purge
        when "quit"
            return false
        else
            puts "Sorry, that command is not recognized."
        end
        return true
    end

    def run
        while (self.get_command)
        end
    end
end