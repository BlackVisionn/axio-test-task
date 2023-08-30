package ru.agapov.axiotask.dao.creditContractDAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.agapov.axiotask.entities.CreditContractEntity;

import java.util.List;

@Repository
public class CreditContractDAOImpl implements CreditContractDAO{

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<CreditContractEntity> allCreditContracts() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from CreditContractEntity").list();
    }

    @Override
    public List<CreditContractEntity> allSignedCreditContracts() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from CreditContractEntity where signingStatus = true").list();
    }

    @Override
    public void create(CreditContractEntity creditContract) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(creditContract);
    }

    @Override
    public void update(CreditContractEntity creditContract) {
        Session session = sessionFactory.getCurrentSession();
        session.update(creditContract);
    }

    @Override
    public void delete(CreditContractEntity creditContract) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(creditContract);
    }

    @Override
    public CreditContractEntity getById(long id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(CreditContractEntity.class, id);
    }
}
