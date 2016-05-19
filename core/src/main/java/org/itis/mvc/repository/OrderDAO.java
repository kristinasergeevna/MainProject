package org.itis.mvc.repository;


import org.itis.mvc.domain.Order;

import java.util.List;

public interface OrderDAO {
    List<Order> getAllOrders();
    void updateOrder(Order user);
    void deleteOrder(Order user);
    void addOrder(Order user);
    Order getOrderById(Integer id);
}
