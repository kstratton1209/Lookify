package com.keara.lookify.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.keara.lookify.models.Lookify;
import com.keara.lookify.services.LookifyService;

@Controller
public class LookifyController {
	
	private final LookifyService lookifyService;
	
	public LookifyController(LookifyService lookifyService) {
		this.lookifyService = lookifyService;
	}
	
	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model, HttpServletRequest request) {
		String q = request.getParameter("q");
		if(q == null) {
			model.addAttribute("all", lookifyService.getAll());			
		} else {
			return "redirect:{q}/search";
		}
		model.addAttribute("lookify", new Lookify());
		return "dashboard.jsp";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("lookify", new Lookify());
		return "new.jsp";
	}
	
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("lookify") Lookify lookify, BindingResult result, Model model) 
	{
    	if (result.hasErrors()) {
    		model.addAttribute("all",lookifyService.getAll());
            return "new.jsp";
        } else {
        	System.out.println(lookify);
        	lookifyService.create(lookify);
        }
    	return "redirect:/dashboard";

    }
	
	@RequestMapping(value="{id}/delete")
    public String delete(@PathVariable("id") Long id) {
        lookifyService.remove(id);
    	return "redirect:/dashboard";
    }
	
	@RequestMapping(value="{id}/details")
    public String details(@PathVariable("id") Long id, Model model) {
        model.addAttribute("lookify", lookifyService.getOne(id));
    	return "details.jsp";
    }
	
	@RequestMapping("{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Lookify lookify = lookifyService.getOne(id);
        model.addAttribute("lookify", lookify);
        return "edit.jsp";
    }
	
	
	@RequestMapping(value="{id}/update", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("lookify") Lookify lookify, BindingResult result, @PathVariable("id") Long id) {
    	if (result.hasErrors()) {
    		System.out.println(result.getAllErrors());
            return "edit.jsp";
        } else {
            lookifyService.update(lookify, id);
            return "redirect:/dashboard";
        }
	}
	
	
	@RequestMapping(value="search", method=RequestMethod.POST)
    public String search(@Valid @ModelAttribute("lookify") Lookify lookify, BindingResult result, @RequestParam("q") String q, Model model) { 
		
		if(q == null) {
			model.addAttribute("all", lookifyService.getAll());			
		} else {
			model.addAttribute("all", lookifyService.search(q));	
		}
		model.addAttribute("song", new Lookify());
		return "search.jsp";
        }

	@RequestMapping("/topTen")
	public String topten(Model model, HttpServletRequest request) {
		model.addAttribute("topTen", lookifyService.topTen());
		return "topten.jsp";
	}


	}

