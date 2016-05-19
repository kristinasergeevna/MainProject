package org.spring.mvc.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Main_Page_Controller {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String renderMainPage() {
        return "redirect:/users_list";
    }
}
