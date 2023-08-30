package ru.agapov.axiotask.dao.clientDAO;

import ru.agapov.axiotask.entities.ClientEntity;

import java.util.List;

public interface ClientDAO {

    List<ClientEntity> allClients();
    void create(ClientEntity clientEntity);
    void update(ClientEntity clientEntity);
    void delete(ClientEntity clientEntity);
    ClientEntity getById(long id);
    List<ClientEntity> getByPassport(String passportSerial, String passportNumber);
    List<ClientEntity> getByContactNumber(String contactNumber);
    List<ClientEntity> getByFullName(String fullName);
}
