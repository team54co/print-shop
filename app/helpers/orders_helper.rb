module OrdersHelper
    def title(order)
      time = order.created_at.strftime("%m/%d/%y")
      'Order ' + order.id.to_s + time.split('/').join
    end

    def counter(order)
      return true if order.ordered_products.count > 0
      
      false
    end
end
