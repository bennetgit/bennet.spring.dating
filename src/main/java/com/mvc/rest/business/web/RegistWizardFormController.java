package com.mvc.rest.business.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.mvc.rest.beans.Ethnicity;
import com.mvc.rest.beans.Relationship;
import com.mvc.rest.beans.UserRegistForm;
import com.mvc.rest.business.domain.Country;
import com.mvc.rest.business.domain.State;
import com.mvc.rest.business.service.ICountryService;
import com.mvc.rest.business.service.IStateService;
import com.mvc.rest.business.service.IUserService;

@Controller
@SessionAttributes("form") 
public class RegistWizardFormController {
	private Logger logger = Logger.getLogger(RegistWizardFormController.class.getName());
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private ICountryService countryService;
	
	@Autowired
	private IStateService stateService;
	
	@Autowired
	private Ethnicity ethnicity;	
	
	@Autowired
	private Relationship relationship;	
	
	// 三个页面分别对应的逻辑视图名  
    private static final String[] VIEW_NAMES = new String[] {  
        "register1",  
        "register2",  
        "register3"  
    };  
  
    @ModelAttribute("form")  
    public UserRegistForm initForm() {  
    	logger.info("initForm()");  
        return new UserRegistForm();  
    }  
  
    // Master Data  
    @ModelAttribute("t_relationship")  
    public HashMap<Integer, String> relationship() {  
    	return (HashMap<Integer, String>) relationship.getItems(); 
    }
    
    @ModelAttribute("t_ethnicity")  
    public HashMap<Integer, String> ethnicity() {  
        return (HashMap<Integer, String>) ethnicity.getItems();  
    }
    
    // 访问“http://localhost:8080/demo/user/regist”时，进入第一个页面  
    @RequestMapping(value = "/register", method = {RequestMethod.GET})  
    public String go(@ModelAttribute("form") UserRegistForm form) {  
    	logger.info("register page 1 : " + VIEW_NAMES[0]); 
        return VIEW_NAMES[0];  
    } 
    
	@RequestMapping(value = "/register", method = {RequestMethod.POST}, params = {"_next", "!_prev", "!_finish"})  
	public String processNext(HttpServletRequest request,HttpServletResponse response, @RequestParam(value = "_page", required = true) int page, @Valid @ModelAttribute("form") UserRegistForm form, BindingResult bindingResult) {  
		logger.info("process 'next', next logic view name : " + VIEW_NAMES[page]);  
	    if (bindingResult.hasErrors()) {  
	    	logger.info("errors !" + bindingResult.toString());
	    }
	    if(page==2){
	    	// 获取国家列表
	    	logger.info("获取国家列表并保存到session!");
	    	List<Country> c = countryService.getCountries();
	    	request.getSession().setAttribute("countries", c);
	    }
        return VIEW_NAMES[page];  
    }
	
    @RequestMapping(value = "/register", method = {RequestMethod.POST}, params = {"!_next", "_prev", "!_finish"})  
    public String processPrev(@RequestParam(value = "_page", required = true) int page, @ModelAttribute("form") UserRegistForm form) {  
    	logger.info("process 'prev', previous logic view name : " + VIEW_NAMES[page - 2]);  
  
        return VIEW_NAMES[page - 2];  
    }  
    
    @RequestMapping(value = "/register", method = {RequestMethod.POST}, params = {"_cancel"})  
    public String processCancel(@RequestParam(value = "_page", required = true) int page, @ModelAttribute("form") UserRegistForm form, SessionStatus sessionStatus) {  
    	logger.info("process 'cancel', previous logic view name : " + VIEW_NAMES[0]);  
    	sessionStatus.setComplete();  
        return VIEW_NAMES[0];  
    } 
    
    //@ResponseBody  
    @RequestMapping(value = "/register", method = {RequestMethod.POST}, params = {"!_next", "!_prev", "_finish"})  
    public String processFinish(@Valid @ModelAttribute("form") UserRegistForm form, BindingResult bindingResult, SessionStatus sessionStatus) {  
    	logger.info("process 'Finish'"); 
        if (bindingResult.hasErrors()) {  
        	// 数据绑定有问题的话，仅仅用一条日志而已  
        	logger.info("Data-binding has errors. \n" );  
        	List<FieldError> filedErrors = bindingResult.getFieldErrors();
        	for(FieldError error:filedErrors)
        	{
        		logger.info(error.getField() + " : " + error.getDefaultMessage());
        	}
        } else {
    		logger.info("------------ addUser ---------- " + form.getUsername() + "------" + form.getPassword());
    		userService.saveUser(form);
        }
  
        // 现在得到的是完整的表单了，怎么做就看业务啦。  
        // 我这里只是把表单的数据用JSON的方式发给浏览器  
  
        sessionStatus.setComplete();  
        return "redirect:photo";  
    }
    
    @ResponseBody  
    @RequestMapping(value = "/getstates", method = {RequestMethod.GET})  
    public List<State> getStates(@RequestParam int country) {  
    	logger.info("ajax 'getStates'"); 
    	
    	List<State> list = stateService.getStates(country);
        //return "redirect:userlist"; 
        return list;
    }
}
