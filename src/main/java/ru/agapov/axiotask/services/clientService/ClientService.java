package ru.agapov.axiotask.services.clientService;

import ru.agapov.axiotask.entities.ClientEntity;
import ru.agapov.axiotask.models.SearchingForm;

import java.util.List;

public interface ClientService {

    List<ClientEntity> allClients();
    void create(ClientEntity clientEntity);
    void update(ClientEntity clientEntity);
    void delete(ClientEntity clientEntity);
    ClientEntity getById(long id);
    List<ClientEntity> searchClients(SearchingForm form);
}
