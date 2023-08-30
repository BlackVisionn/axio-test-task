package ru.agapov.axiotask.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import ru.agapov.axiotask.entities.CreditContractEntity;
import ru.agapov.axiotask.services.creditContractService.CreditContractService;

import java.util.List;

@Controller
public class CreditContractController {
    private CreditContractService creditContractService;

    @Autowired
    public void setCreditContractService(CreditContractService creditContractService) {
        this.creditContractService = creditContractService;
    }

    @GetMapping("/creditContracts_list")
    public ModelAndView allCreditContracts() {
        List<CreditContractEntity> creditContracts = creditContractService.allSignedCreditContracts();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("creditContracts_list");
        modelAndView.addObject("creditContractsList", creditContracts);
        return modelAndView;
    }
}
