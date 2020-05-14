require 'pry'
class CashRegister
  attr_accessor :total, :last_total
  attr_reader :discount, :items
  def initialize(discount= 0)
    @total = 0 
    @discount = discount
    @items = []
    @last_total = 0
  end
  
  def add_item(title, price, quantity = 1)
    if quantity > 1 
      (title.split * quantity).each do |each_item|
        self.items << each_item
      end
    else
    self.items << title
  end
    self.last_total = price * quantity
    self.total += price * quantity
  end
  
  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else
    self.total *= ((100.0 - self.discount.to_f)/100)
    "After the discount, the total comes to $#{self.total.to_i}."
    end
  end
  
 
  
  def void_last_transaction
    if self.items.length == 0
      self.total = 0
    else 
       self.total = self.total - self.last_total
   end
  end
end


