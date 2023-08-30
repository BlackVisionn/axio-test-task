package ru.agapov.axiotask.entities;

import javax.persistence.*;

@Entity
@Table(name = "approved_credit_decisions")
public class ApprovedCreditDecisionEntity {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "credit_maturity")
    private int creditMaturity;

    @Column(name = "approved_credit_amount")
    private long approvedCreditAmount;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getCreditMaturity() {
        return creditMaturity;
    }

    public void setCreditMaturity(int creditMaturity) {
        this.creditMaturity = creditMaturity;
    }

    public long getApprovedCreditAmount() {
        return approvedCreditAmount;
    }

    public void setApprovedCreditAmount(long approvedCreditAmount) {
        this.approvedCreditAmount = approvedCreditAmount;
    }
}
