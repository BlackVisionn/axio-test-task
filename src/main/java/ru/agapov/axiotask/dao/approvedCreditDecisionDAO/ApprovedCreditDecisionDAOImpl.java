package ru.agapov.axiotask.dao.approvedCreditDecisionDAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.agapov.axiotask.entities.ApprovedCreditDecisionEntity;

import java.util.List;

@Repository
public class ApprovedCreditDecisionDAOImpl implements ApprovedCreditDecisionDAO{

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<ApprovedCreditDecisionEntity> allApprovedCreditDecisions() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from ApprovedCreditDecision").list();
    }

    @Override
    public void create(ApprovedCreditDecisionEntity approvedCreditDecisionEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(approvedCreditDecisionEntity);
    }

    @Override
    public void update(ApprovedCreditDecisionEntity approvedCreditDecisionEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.update(approvedCreditDecisionEntity);
    }

    @Override
    public void delete(ApprovedCreditDecisionEntity approvedCreditDecisionEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(approvedCreditDecisionEntity);
    }

    @Override
    public ApprovedCreditDecisionEntity getById(long id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(ApprovedCreditDecisionEntity.class, id);
    }

    @Override
    public ApprovedCreditDecisionEntity getByCreditApplicationId(long id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from ApprovedCreditDecision where creditApplication.id = :id");
        query.setParameter("id", id);
        List list = query.list();
        return (ApprovedCreditDecisionEntity) list.get(0);
    }
}
