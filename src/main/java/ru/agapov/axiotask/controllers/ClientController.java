package ru.agapov.axiotask.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import ru.agapov.axiotask.entities.ClientEntity;
import ru.agapov.axiotask.models.SearchingForm;
import ru.agapov.axiotask.services.clientService.ClientService;

import java.util.List;

@Controller
public class ClientController {
    private ClientService clientService;

    @Autowired
    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    @GetMapping("/clients_list")
    public ModelAndView allClients() {
        List<ClientEntity> clientEntities = clientService.allClients();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("clients_list");
        modelAndView.addObject("clientsList", clientEntities);
        return modelAndView;
    }

    @PostMapping("/clients_list")
    public ModelAndView clientFilter(@ModelAttribute SearchingForm form) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("clients_list");
        modelAndView.addObject("clientsList", clientService.searchClients(form));
        return modelAndView;
    }

    @GetMapping("/clients_list/{id}")
    public ModelAndView showClient(@PathVariable long id) {
        ClientEntity clientEntity = clientService.getById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("client");
        modelAndView.addObject("client", clientEntity);
        return modelAndView;
    }
}
