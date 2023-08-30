package ru.agapov.axiotask.dao.creditApplicationDAO;

import ru.agapov.axiotask.entities.CreditApplicationEntity;

import java.util.List;

public interface CreditApplicationDAO {
    List<CreditApplicationEntity> allCreditApplications();
    void create(CreditApplicationEntity creditApplicationEntity);
    void update(CreditApplicationEntity creditApplicationEntity);
    void delete(CreditApplicationEntity creditApplicationEntity);
    CreditApplicationEntity getById(long id);
}
