package ru.agapov.axiotask.dao.creditApplicationDAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.agapov.axiotask.entities.CreditApplicationEntity;

import java.util.List;

@Repository
public class CreditApplicationDAOImpl implements CreditApplicationDAO{

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<CreditApplicationEntity> allCreditApplications() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from CreditApplicationEntity").list();
    }

    @Override
    public void create(CreditApplicationEntity creditApplicationEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(creditApplicationEntity);
    }

    @Override
    public void update(CreditApplicationEntity creditApplicationEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.update(creditApplicationEntity);
    }

    @Override
    public void delete(CreditApplicationEntity creditApplicationEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(creditApplicationEntity);
    }

    @Override
    public CreditApplicationEntity getById(long id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(CreditApplicationEntity.class, id);
    }
}
