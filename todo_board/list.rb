require_relative "./item.rb"

class List
    def initialize(label)
        @label = label
        @items = []
    end

    attr_accessor :label

    def add_item(title, deadline, description = "")
        return false if !Item.valid_date?(deadline)
        item = Item.new(title, deadline, description)
        @items << item
        return true
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        return (idx >= 0 ) && (idx < @items.length)
    end

    def swap(idx1, idx2)
        if self.valid_index?(idx1) && self.valid_index?(idx2)
            @items[idx1] , @items[idx2] = @items[idx2], @items[idx1]
            return true
        else
            return false
        end 
    end

    def [](idx)
        return @items[idx]
    end

    def priority
        return @items[0]
    end

    def print_list
        puts "------------------------------------------"
        puts "                " + @label.upcase
        puts "------------------------------------------"
        puts "Index | Item | Deadline | Done?"
        @items.each_with_index do |item, idx|
            puts idx.to_s + "     | " + item.title + " | " + item.deadline + " | " + item.done.to_s
        end
        puts "------------------------------------------"
    end

    def print_full_item(idx)
        puts "------------------------------------------"
        puts @items[idx].title + " | " + @items[idx].deadline + " | " + @items[idx].done.to_s
        puts @items[idx].description
        puts "------------------------------------------"
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(idx, amount = 1)
        if !self.valid_index?(idx)
            return false
        elsif amount == 0 || idx == 0
            return true
        else
            self.swap(idx, idx-1)
            self.up(idx-1, amount-1)
        end
    end

    def down(idx, amount = 1)
        if !self.valid_index?(idx)
            return false
        elsif amount == 0 || idx == @items.length-1
            return true
        else
            self.swap(idx, idx+1)
            self.down(idx+1, amount-1)
        end
    end

    def sort_by_date
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(idx)
        @items[idx].toggle
    end

    def remove_item(idx)
        if !self.valid_index?(idx)
            return false
        else
            @items.delete_at(idx)
            return true
        end
    end

    def purge
        removes = []
        @items.each_with_index do |item, idx|
            removes << idx if item.done
        end
        removes.reverse!
        #reverse order so indexes aren't shifted as we remove things
        removes.each do |idx|
            self.remove_item(idx)
        end
    end
end