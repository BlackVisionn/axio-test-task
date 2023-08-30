package ru.agapov.axiotask.dao.clientDAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.agapov.axiotask.entities.ClientEntity;

import java.util.List;

@Repository
public class ClientDAOImpl implements ClientDAO{

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<ClientEntity> allClients() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from ClientEntity").list();
    }

    @Override
    public void create(ClientEntity clientEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(clientEntity);
    }

    @Override
    public void update(ClientEntity clientEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.update(clientEntity);
    }

    @Override
    public void delete(ClientEntity clientEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(clientEntity);
    }

    @Override
    public ClientEntity getById(long id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(ClientEntity.class, id);
    }

    @Override
    public List<ClientEntity> getByPassport(String passportSerial, String passportNumber) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from ClientEntity where passportSerial = :passportSerial and passportNumber = :passportNumber");
        query.setParameter("passportSerial", passportSerial);
        query.setParameter("passportNumber", passportNumber);
        return query.list();
    }

    @Override
    public List<ClientEntity> getByContactNumber(String contactNumber) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from ClientEntity where contactNumber = :contactNumber");
        query.setParameter("contactNumber", contactNumber);
        return query.list();
    }

    @Override
    public List<ClientEntity> getByFullName(String fullName) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from ClientEntity where fullName = :fullName");
        query.setParameter("fullName", fullName);
        return query.list();
    }
}
