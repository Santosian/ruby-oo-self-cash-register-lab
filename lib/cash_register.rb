
class CashRegister
    attr_accessor :total, :discount, :items


    def initialize(employee_discount = 0)
        @total = 0
        @discount = employee_discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        @items += [title] * quantity
        @last_price = price * quantity
    end

    def apply_discount

        if @discount > 0
            descontado = @total * (@discount/100.0)
            @total -= descontado # le restamos el descuento al total. Esto altera el total
            @total = @total.to_i
            "After the discount, the total comes to $#{@total}."
        else 
            "There is no discount to apply."     
        end
    end

    def void_last_transaction
        @total -= @last_price
    end

end

=begin
cs = CashRegister.new #new llama a inititalize
cs.total #esto existe
cs.employee_discount #esto nunca existio (employee_discount es simplemente un argumento de new/initialize) 
cs.discount #esto existe pero si no tiene accesor no se puede acceder de esta manera
=end

=begin
# para que ruby haga division con decimales, al menos uno de los input debe ser un float
2.6.1 :004 > 1/2
 => 0 
2.6.1 :005 > 1.0 / 2.0
 => 0.5 
2.6.1 :006 > 1 / 2.0
 => 0.5 
2.6.1 :007 > 1.0 / 2
 => 0.5 
=end
