package org.spring.mvc.controllers;

import org.apache.commons.codec.digest.DigestUtils;
import org.itis.mvc.domain.User;
import org.itis.mvc.service.UserService;
import org.spring.mvc.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class User_Controller {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private UserService userService;
    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/new_user", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user,
                          BindingResult result) {
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "form/new_user";
        }
        userService.addUser(user);
        return "redirect:users_list";
    }

    @RequestMapping(value = "/new_user", method = RequestMethod.GET)
    public String renderUserForm(ModelMap modelMap) {
        modelMap.addAttribute("user", new User());
        return "form/new_user";
    }

    @RequestMapping(value = "/edit_user", method = RequestMethod.POST)
    public String editUser(@ModelAttribute("user") User user,
                           BindingResult result, ModelMap modelMap) {
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            modelMap.addAttribute("f_user", userService.getUserById(user.getId()));
            return "form/edit_user";
        }
        userService.updateUser(user);
        return "redirect:users_list";
    }

    @RequestMapping(value = "/delete_user", method = RequestMethod.GET)
    public String deleteUser(@RequestParam("id") Integer id) {
        userService.deleteUser(userService.getUserById(id));
        return "redirect:users_list";
    }

    @RequestMapping(value = "/edit_user", method = RequestMethod.GET)
    public String renderUserEditForm(@RequestParam("id") Integer id, ModelMap modelMap) {
        modelMap.addAttribute("user", new User());
        modelMap.addAttribute("f_user", userService.getUserById(id));
        return "form/edit_user";
    }

    @RequestMapping(value = "/users_list", method = RequestMethod.GET)
    public String renderUsersList(ModelMap modelMap) {
        modelMap.addAttribute("list_of_users", userService.getAllUsers());
        return "list/list_of_users";
    }
}
