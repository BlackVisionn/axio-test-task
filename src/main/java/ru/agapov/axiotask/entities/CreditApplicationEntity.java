package ru.agapov.axiotask.entities;

import javax.persistence.*;

@Entity
@Table(name = "credit_applications")
public class CreditApplicationEntity {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    @JoinColumn(name = "client_id")
    private ClientEntity clientEntity;

    @Column(name = "desired_credit_amount")
    private long desiredCreditAmount;

    @OneToOne
    @JoinColumn(name = "credit_decision_id")
    private ApprovedCreditDecisionEntity approvedCreditDecisionEntity;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public ClientEntity getClient() {
        return clientEntity;
    }

    public void setClient(ClientEntity clientEntity) {
        this.clientEntity = clientEntity;
    }

    public long getDesiredCreditAmount() {
        return desiredCreditAmount;
    }

    public void setDesiredCreditAmount(long desiredCreditAmount) {
        this.desiredCreditAmount = desiredCreditAmount;
    }

    public ApprovedCreditDecisionEntity getApprovedCreditDecision() {
        return approvedCreditDecisionEntity;
    }

    public void setApprovedCreditDecision(ApprovedCreditDecisionEntity approvedCreditDecisionEntity) {
        this.approvedCreditDecisionEntity = approvedCreditDecisionEntity;
    }
}
