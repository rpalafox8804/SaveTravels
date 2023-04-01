package com.codingdojo.SaveTravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.SaveTravels.models.Expense;
import com.codingdojo.SaveTravels.services.SaveTravelsService;

@Controller
public class SaveTravelsController {
	@Autowired
	SaveTravelsService expenseService;
	
	@GetMapping("/expenses")
	public String index(Model model, @ModelAttribute("expense") Expense expense) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "index.jsp";
	}
	@PostMapping("/expenses")
	public String createExpense(@Valid @ModelAttribute("expense")Expense expense, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("expenses", expenseService.allExpenses());
			return "index.jsp";
		}		
		expenseService.createExpense(expense);
		return "redirect:/expenses";
	}
	@RequestMapping("/expenses/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
		Expense expense = expenseService.findExpense(id);
        model.addAttribute("expense", expense);
        return "edit.jsp";
    }
    
//	@PutMapping("/books/{id}")
    @RequestMapping(value="/expenses/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
    		System.out.println(result);
        	if (result.hasErrors()) {
            return "edit.jsp";
        	} else {
        	System.out.println(expense.getId());
        	System.out.println(expense.getExpenseName());
        	System.out.println(expense.getVendor());
        	System.out.println(expense.getAmount());
            expenseService.updateExpense(expense);
            return "redirect:/expenses";
        }
    }
//    @DeleteMapping("/expenses/delete/{id}")
    @RequestMapping(value="/expenses/delete/{id}", method=RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
			expenseService.deleteExpense(id);
            return "redirect:/expenses";
        }
    @GetMapping("/expenses/delete/{id}")
	public String oneExpense(Model model, @ModelAttribute("expense") Expense expense, @PathVariable("id") Long id) {
		Expense expenses = expenseService.findExpense(id);
		model.addAttribute("expenses", expenses);
		return "viewExpense.jsp";
	}

}
