package ru.agapov.axiotask.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;
import ru.agapov.axiotask.entities.CreditApplicationEntity;
import ru.agapov.axiotask.services.creditApplicationService.CreditApplicationService;

import java.util.List;

@Controller
public class CreditApplicationController {
    private CreditApplicationService creditApplicationService;

    @Autowired
    public void setCreditApplicationService(CreditApplicationService creditApplicationService) {
        this.creditApplicationService = creditApplicationService;
    }

    @GetMapping("/creditApplications_list")
    public ModelAndView allCreditApplications() {
        List<CreditApplicationEntity> creditApplicationEntities = creditApplicationService.allCreditApplications();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("creditApplications_list");
        modelAndView.addObject("creditApplicationsList", creditApplicationEntities);
        return modelAndView;
    }

    @GetMapping("/creditApplications_list/{id}")
    public ModelAndView showCreditApplication(@PathVariable long id) {
        CreditApplicationEntity creditApplicationEntity = creditApplicationService.getById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("creditApplication");
        modelAndView.addObject("creditApplication", creditApplicationEntity);
        return modelAndView;
    }
}
