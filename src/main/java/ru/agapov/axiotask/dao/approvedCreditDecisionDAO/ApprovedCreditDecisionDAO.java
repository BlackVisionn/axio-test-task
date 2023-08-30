package ru.agapov.axiotask.dao.approvedCreditDecisionDAO;

import ru.agapov.axiotask.entities.ApprovedCreditDecisionEntity;

import java.util.List;

public interface ApprovedCreditDecisionDAO {
    List<ApprovedCreditDecisionEntity> allApprovedCreditDecisions();

    void create(ApprovedCreditDecisionEntity approvedCreditDecisionEntity);

    void update(ApprovedCreditDecisionEntity approvedCreditDecisionEntity);

    void delete(ApprovedCreditDecisionEntity approvedCreditDecisionEntity);

    ApprovedCreditDecisionEntity getById(long id);

    public ApprovedCreditDecisionEntity getByCreditApplicationId(long id);
}
