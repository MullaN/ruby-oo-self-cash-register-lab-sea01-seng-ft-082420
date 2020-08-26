class CashRegister
    attr_accessor :discount, :total, :last_transaction
    attr_reader :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = {}
    end

    def add_item(title, price, quantity = 1)
        quantity.times {self.items << title}
        self.total += price * quantity
        self.last_transaction[:title] = title
        self.last_transaction[:price] = price
        self.last_transaction[:quantity] = quantity
    end

    def apply_discount
        if self.discount > 0
            self.total -= self.total * self.discount / 100
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        if self.last_transaction[:title]
            self.last_transaction[:quantity].times {self.items.pop}
            self.total -= self.last_transaction[:price] * self.last_transaction[:quantity]
        end
    end
end
