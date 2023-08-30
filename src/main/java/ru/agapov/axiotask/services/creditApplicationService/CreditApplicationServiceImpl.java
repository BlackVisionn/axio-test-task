package ru.agapov.axiotask.services.creditApplicationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.agapov.axiotask.dao.approvedCreditDecisionDAO.ApprovedCreditDecisionDAO;
import ru.agapov.axiotask.dao.clientDAO.ClientDAO;
import ru.agapov.axiotask.dao.creditApplicationDAO.CreditApplicationDAO;
import ru.agapov.axiotask.entities.ApprovedCreditDecisionEntity;
import ru.agapov.axiotask.entities.ClientEntity;
import ru.agapov.axiotask.entities.CreditApplicationEntity;
import ru.agapov.axiotask.models.CreditApplicationForm;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Random;

@Service
public class CreditApplicationServiceImpl implements CreditApplicationService{

    private CreditApplicationDAO creditApplicationDAO;

    private ClientDAO clientDAO;

    private ApprovedCreditDecisionDAO approvedCreditDecisionDAO;

    @Autowired
    public void setCreditApplicationDAO(CreditApplicationDAO creditApplicationDAO) {
        this.creditApplicationDAO = creditApplicationDAO;
    }

    @Autowired
    public void setClientDAO(ClientDAO clientDAO) {
        this.clientDAO = clientDAO;
    }

    @Autowired
    public void setApprovedCreditDecisionDAO(ApprovedCreditDecisionDAO approvedCreditDecisionDAO) {
        this.approvedCreditDecisionDAO = approvedCreditDecisionDAO;
    }

    @Override
    @Transactional
    public List<CreditApplicationEntity> allCreditApplications() {
        return creditApplicationDAO.allCreditApplications();
    }

    @Override
    @Transactional
    public long create(CreditApplicationForm form) {
        List<ClientEntity> clientByPassport = clientDAO.getByPassport(form.getPassportSerial(), form.getPassportNumber());

        ClientEntity client;

        if (clientByPassport.isEmpty()) {
            client = new ClientEntity();
            client = form.parseEntityFromForm(client);

            clientDAO.create(client);
        } else {
            client = clientByPassport.get(0);
            client = form.parseEntityFromForm(client);

            clientDAO.update(client);
        }

        CreditApplicationEntity creditApplication = new CreditApplicationEntity();
        creditApplication.setClient(client);
        creditApplication.setDesiredCreditAmount(form.getDesiredCreditAmount());
        creditApplicationDAO.create(creditApplication);

        return creditApplication.getId();
    }

    @Override
    @Transactional
    public void makeDecision(CreditApplicationEntity creditApplicationEntity) {
        ApprovedCreditDecisionEntity approvedCreditDecision = new ApprovedCreditDecisionEntity();

        Random random = new Random();

        if (random.nextBoolean()) {
            int minTerm = 30;
            int maxTerm = 365;
            int diffTerm = maxTerm - minTerm;
            int termValue = random.nextInt(diffTerm + 1);
            termValue += minTerm;
            approvedCreditDecision.setCreditMaturity(termValue);

            long minAmount = 5000;
            long maxAmount = creditApplicationEntity.getDesiredCreditAmount();
            int diffAmount = (int) (maxAmount - minAmount);
            long amountValue = random.nextInt(diffAmount + 1);
            amountValue += minAmount;
            approvedCreditDecision.setApprovedCreditAmount(amountValue);

            approvedCreditDecisionDAO.create(approvedCreditDecision);

            creditApplicationEntity.setApprovedCreditDecision(approvedCreditDecision);

            creditApplicationDAO.update(creditApplicationEntity);
        }
    }

    @Override
    @Transactional
    public void delete(CreditApplicationEntity creditApplicationEntity) {
        creditApplicationDAO.delete(creditApplicationEntity);
    }

    @Override
    @Transactional
    public CreditApplicationEntity getById(long id) {
        return creditApplicationDAO.getById(id);
    }
}
