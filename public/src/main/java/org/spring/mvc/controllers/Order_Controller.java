package org.spring.mvc.controllers;

import org.itis.mvc.domain.Order;
import org.itis.mvc.service.OrderService;
import org.itis.mvc.service.UserService;
import org.spring.mvc.validator.OrderValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;


@Controller
public class Order_Controller {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderValidator orderValidator;
    @RequestMapping(value = "/orders_list", method = RequestMethod.GET)
    public String renderOrdersList(  ModelMap modelMap) {
        modelMap.addAttribute("list_of_orders", orderService.getAllOrders());
        return "list/list_of_orders";
    }
    @RequestMapping(value = "/new_order", method = RequestMethod.POST)
    public String addOrder(@ModelAttribute("order") Order order,
                          BindingResult result) {
        orderValidator.validate(order, result);
        if (result.hasErrors()) {
            request.setAttribute("list_of_users", userService.getAllUsers());
            return "form/new_order";
        }
        orderService.addOrder(order);
        return "redirect:orders_list";
    }
    @RequestMapping(value = "/new_order", method = RequestMethod.GET)
    public String renderOrderForm(ModelMap modelMap) {
        modelMap.addAttribute("list_of_users", userService.getAllUsers());
        modelMap.addAttribute("order", new Order());
        return "form/new_order";
    }

    @RequestMapping(value = "/edit_order", method = RequestMethod.POST)
    public String editOrder(@ModelAttribute("order") Order order,
                           BindingResult result) {
        orderValidator.validate(order, result);
        if (result.hasErrors()) {
            request.setAttribute("list_of_users", userService.getAllUsers());
            request.setAttribute("f_order", orderService.getOrderById(order.getId()));
            return "form/edit_order";
        }
        orderService.updateOrder(order);
        return "redirect:orders_list";
    }
    @RequestMapping(value = "/delete_order", method = RequestMethod.GET)
    public String deleteOrder(@RequestParam("id") Integer id) {
        orderService.deleteOrder(orderService.getOrderById(id));
        return "redirect:orders_list";
    }
    @RequestMapping(value = "/edit_order", method = RequestMethod.GET)
    public String renderUserEditForm(@RequestParam("id") Integer id, ModelMap modelMap) {
        modelMap.addAttribute("order", new Order());
        modelMap.addAttribute("list_of_users", userService.getAllUsers());
        modelMap.addAttribute("f_order", orderService.getOrderById(id));
        return "form/edit_order";
    }
}
