package ru.agapov.axiotask.entities;


import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "credit_contracts")
public class CreditContractEntity {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "signing_date")
    private Date signingDate;

    @Column(name = "signing_status")
    private boolean signingStatus;

    @OneToOne
    @JoinColumn(name = "credit_application_id")
    private CreditApplicationEntity creditApplicationEntity;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getSigningDate() {
        return signingDate;
    }

    public void setSigningDate(Date signingDate) {
        this.signingDate = signingDate;
    }

    public boolean isSigningStatus() {
        return signingStatus;
    }

    public void setSigningStatus(boolean signingStatus) {
        this.signingStatus = signingStatus;
    }

    public CreditApplicationEntity getCreditApplicationEntity() {
        return creditApplicationEntity;
    }

    public void setCreditApplicationEntity(CreditApplicationEntity creditApplicationEntity) {
        this.creditApplicationEntity = creditApplicationEntity;
    }
}
