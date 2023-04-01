package com.codingdojo.SaveTravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.SaveTravels.models.Expense;
import com.codingdojo.SaveTravels.repositories.SaveTravelsRepository;



@Service
public class SaveTravelsService {
	
	
	    // adding the book repository as a dependency
	   	@Autowired
	   	private SaveTravelsRepository expenseRepository;
	   	
	    // returns all the expenses
	    public List<Expense> allExpenses() {
	        return expenseRepository.findAll();
	    }
	    // creates a book
	    public Expense createExpense(Expense e) {
	        return expenseRepository.save(e);
	    }
	    // retrieves a book
	    public Expense findExpense(Long id) {
	        Optional<Expense> optionalExpense = expenseRepository.findById(id);
	        if(optionalExpense.isPresent()) {
	            return optionalExpense.get();
	        } else {
	            return null;
	        }
	    }
	    public Expense updateExpense(Expense e) {
	  	    	return expenseRepository.save(e);
        }
	    
	    public void deleteExpense(Long id) {
  	    	expenseRepository.deleteById(id);
	    }
}
