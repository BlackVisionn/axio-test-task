package ru.agapov.axiotask.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import ru.agapov.axiotask.entities.CreditApplicationEntity;
import ru.agapov.axiotask.models.CreditApplicationForm;
import ru.agapov.axiotask.models.CreditContractForm;
import ru.agapov.axiotask.services.creditApplicationService.CreditApplicationService;
import ru.agapov.axiotask.services.creditContractService.CreditContractService;

import javax.validation.Valid;


@Controller
@RequestMapping("credit-processing")
public class CreditOrderingController {

    private long currentCreditApplicationId = -1;
    private CreditApplicationService creditApplicationService;
    private CreditContractService creditContractService;

    @Autowired
    public void setCreditApplicationService(CreditApplicationService creditApplicationService) {
        this.creditApplicationService = creditApplicationService;
    }

    @Autowired
    public void setCreditContractService(CreditContractService creditContractService) {
        this.creditContractService = creditContractService;
    }

    @GetMapping("/step-1")
    public ModelAndView createCreditApplicationPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("createCreditApplicationForm");
        return modelAndView;
    }

    @PostMapping("/step-1")
    public ModelAndView createCreditApplication(@ModelAttribute("creditApplicationForm") @Valid CreditApplicationForm form,
                                              BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        FieldError test = bindingResult.getFieldError("workPeriod");

        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("createCreditApplicationForm");
            modelAndView.addObject("bindingResult", bindingResult);
            return modelAndView;
        }

        currentCreditApplicationId = creditApplicationService.create(form);
        modelAndView.setViewName("redirect:/credit-processing/step-2");
        return modelAndView;
    }

    @GetMapping("/step-2")
    public ModelAndView creditDecisionPage() {
        ModelAndView modelAndView = new ModelAndView();
        CreditApplicationEntity creditApplication = creditApplicationService.getById(currentCreditApplicationId);

        if (currentCreditApplicationId == -1) {
            modelAndView.setViewName("redirect:/");
        } else {
            creditApplicationService.makeDecision(creditApplication);
            modelAndView.setViewName("creditDecision");
            modelAndView.addObject("creditDecision", creditApplication.getApprovedCreditDecision());
        }
        return modelAndView;
    }

    @GetMapping("/step-3")
    public ModelAndView creditContractPage() {
        ModelAndView modelAndView = new ModelAndView();
        CreditApplicationEntity creditApplication = creditApplicationService.getById(currentCreditApplicationId);

        if (currentCreditApplicationId == -1) {
            modelAndView.setViewName("redirect:/");
        } else {
            modelAndView.addObject("creditApplication", creditApplication);
            modelAndView.setViewName("creditContractForm");
        }
        return modelAndView;
    }

    @PostMapping("/step-3")
    public ModelAndView signContract(@ModelAttribute("creditContractForm") CreditContractForm form) {
        ModelAndView modelAndView = new ModelAndView();
        creditContractService.sign(form, currentCreditApplicationId);
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }
}
