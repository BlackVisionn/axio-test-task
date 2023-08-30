package ru.agapov.axiotask.services.creditApplicationService;

import ru.agapov.axiotask.entities.CreditApplicationEntity;
import ru.agapov.axiotask.models.CreditApplicationForm;

import java.util.List;

public interface CreditApplicationService {

    List<CreditApplicationEntity> allCreditApplications();
    long create(CreditApplicationForm form);
    void makeDecision(CreditApplicationEntity creditApplicationEntity);
    void delete(CreditApplicationEntity creditApplicationEntity);
    CreditApplicationEntity getById(long id);
}
