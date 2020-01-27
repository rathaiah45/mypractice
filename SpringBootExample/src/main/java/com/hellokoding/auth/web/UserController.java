package com.hellokoding.auth.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hellokoding.auth.model.ConfirmationToken;
import com.hellokoding.auth.model.User;
import com.hellokoding.auth.repository.ConfirmationTokenRepository;
import com.hellokoding.auth.repository.UserRepository;
import com.hellokoding.auth.service.SecurityService;
import com.hellokoding.auth.service.UserService;
import com.hellokoding.auth.validator.UserValidator;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;

	@Autowired
	private ConfirmationTokenRepository confirmationTokenRepository;
	
	@Autowired
	private UserRepository userRepository;
	@GetMapping("/registration")
	public String registration(Model model) {
		model.addAttribute("userForm", new User());

		return "registration";
	}

	@PostMapping("/registration")
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "registration";
		}
		userForm.setEnabled(true);
		model.addAttribute("InActive", true);
		userService.save(userForm);
		User user = userService.findByUsername(userForm.getUsername());

		ConfirmationToken confirmationToken = new ConfirmationToken(user);

		confirmationTokenRepository.save(confirmationToken);
		securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

		return "redirect:/welcome";
	}

	@GetMapping("/login")
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

	@GetMapping({ "/", "/welcome" })
	public String welcome(Model model) {
		return "welcome";
	}

	@RequestMapping(value = "/account-request-user", method = RequestMethod.GET)
	public String getAccountRequestUsers(Model model) {
		List<ConfirmationToken> tokens = (List<ConfirmationToken>) confirmationTokenRepository.findAll();
		model.addAttribute("tokens", tokens);
		return "uw/common/tile/admin";
	}

	@RequestMapping(value = "/confirm-account", method = { RequestMethod.GET, RequestMethod.POST })
	public String confirmUserAccount(ModelMap model, @RequestParam("token") String confirmationToken) {
		ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);

		if (token != null) {
			User user = userService.findByUsername(token.getUser().getUsername());
			String name = user.getLastname() + " " + user.getFirstname();
			if (user.getEnabled().equals(true)) {
				user.setEnabled(false);
				model.addAttribute("activation", name + " " + "Congratulations! Your account has been deactivated");
			} else {
				user.setEnabled(true);
				model.addAttribute("activation", name + " " + "Congratulations! Your account has been activated");
			}
			
			userRepository.save(user);
			List<ConfirmationToken> tokens = (List<ConfirmationToken>) confirmationTokenRepository.findAll();
			model.addAttribute("tokens", tokens);
			return "uw/common/tile/admin";
		} else {
			model.addAttribute("message", "The link is invalid or broken!");
			return "uw/common/tile/error";
		}
	}
}
