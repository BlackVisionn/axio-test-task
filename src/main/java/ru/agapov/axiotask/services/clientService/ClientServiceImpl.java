package ru.agapov.axiotask.services.clientService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.agapov.axiotask.dao.clientDAO.ClientDAO;
import ru.agapov.axiotask.entities.ClientEntity;
import ru.agapov.axiotask.models.SearchingForm;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class ClientServiceImpl implements ClientService{

    private ClientDAO clientDAO;

    @Autowired
    public void setClientDAO(ClientDAO clientDAO) {
        this.clientDAO = clientDAO;
    }

    @Override
    @Transactional
    public List<ClientEntity> allClients() {
        return clientDAO.allClients();
    }

    @Override
    @Transactional
    public void create(ClientEntity clientEntity) {

        clientDAO.create(clientEntity);
    }

    @Override
    @Transactional
    public void update(ClientEntity clientEntity) {
        clientDAO.update(clientEntity);
    }

    @Override
    @Transactional
    public void delete(ClientEntity clientEntity) {
        clientDAO.delete(clientEntity);
    }

    @Override
    @Transactional
    public ClientEntity getById(long id) {
        return clientDAO.getById(id);
    }

    @Override
    @Transactional
    public List<ClientEntity> searchClients(SearchingForm form) {
        List<ClientEntity> resultList = new ArrayList<>();

        if(Objects.equals(form.getSearchingValue().replaceAll(" ", ""), "")) {
            return clientDAO.allClients();
        }

        switch (form.getSearchType()) {
            case 0:
                resultList = clientDAO.getByFullName(form.getSearchingValue());
                break;
            case 1:
                resultList = clientDAO.getByContactNumber(form.getSearchingValue());
                break;
            case 2:
                String[] passportData = form.parsePassportData();
                resultList = clientDAO.getByPassport(passportData[0], passportData[1]);
                break;
        }

        return resultList;
    }
}
