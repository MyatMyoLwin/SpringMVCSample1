package orderexercise;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

	/*List<User> userList;

	@Autowired
	private UserDAL userDao;
	
	@Autowired
	@Qualifier("loginValidator")
	private Validator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}*/
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String initialPath() {
		return "login";
	}
	
/*	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginGet() {

		ModelAndView modelView = new ModelAndView("login", "user", new User());
		ModelAndView modelView = new ModelAndView("login");
		return modelView;
	}
	*/
	/*@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(@ModelAttribute("user") @Validated User user, BindingResult result) {
			
		userList = new ArrayList<User>();
		
		try {
			if (!result.hasErrors()) {
				
				System.out.println(user.getName()+"/"+user.getPassword());
				
				userList = userDao.getAll();

				for (User usr : userList) {
					if (usr.getName().equals(user.getName()) && usr.getPassword() == user.getPassword()) {
						return "redirect:product";
					}
				}
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		return "login";
	}*/
	
/*	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		

		ModelAndView model = new ModelAndView();
		model.setViewName("login");

		return model;

	}*/
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
 
		return "login";
 
	}
		
	
}
