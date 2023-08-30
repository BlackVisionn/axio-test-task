package ru.agapov.axiotask.services.creditContractService;

import ru.agapov.axiotask.entities.CreditContractEntity;
import ru.agapov.axiotask.models.CreditContractForm;

import java.util.List;

public interface CreditContractService {
    List<CreditContractEntity> allCreditContracts();
    List<CreditContractEntity> allSignedCreditContracts();
    void sign(CreditContractForm creditContractForm, long creditApplicationId);
    void update(CreditContractEntity creditContractEntity);
    void delete(CreditContractEntity creditContractEntity);
    CreditContractEntity getById(long id);
}
