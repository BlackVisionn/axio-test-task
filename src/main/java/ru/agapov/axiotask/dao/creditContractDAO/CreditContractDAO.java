package ru.agapov.axiotask.dao.creditContractDAO;

import ru.agapov.axiotask.entities.CreditContractEntity;

import java.util.List;

public interface CreditContractDAO {

    List<CreditContractEntity> allCreditContracts();
    List<CreditContractEntity> allSignedCreditContracts();
    void create(CreditContractEntity creditContractEntity);
    void update(CreditContractEntity creditContractEntity);
    void delete(CreditContractEntity creditContractEntity);
    CreditContractEntity getById(long id);
}
