package ru.agapov.axiotask.models;

import ru.agapov.axiotask.entities.ClientEntity;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class CreditApplicationForm {
    @NotEmpty(message = "ФИО не может быть пустым")
    @Size(min = 3, max = 250, message = "ФИО некорректной длины")
    private String fullName;

    @NotEmpty(message = "Серия паспорта не может быть пустой")
    @Size (min = 4, max = 4, message = "Серия паспорта должна состоять из 4 цифр")
    private String passportSerial;

    @NotEmpty(message = "Номер паспорта не может быть пустым")
    @Size (min = 6, max = 6, message = "Номер паспорта должен состоять из 6 цифр")
    private String passportNumber;

    private boolean maritalStatus;

    @NotEmpty(message = "Адрес прописки не может быть пустым")
    @Size(min = 1, max = 250, message = "Адрес прописки некорректной длины")
    private String registrationAddress;

    @NotEmpty(message = "Контактный номер не может быть пустым")
    @Size(min = 10, max = 10, message = "Номер телефона (без 8) должен состоять из 10 цифр")
    private String contactNumber;

    @NotEmpty(message = "Название организации не может быть пустым")
    @Size(min = 1, max = 100, message = "Название организации некорректной длины")
    private String companyName;

    @NotEmpty(message = "Должность не может быть пустой")
    @Size(min = 3, max = 100, message = "Должность некорректной длины")
    private String post;

    @Min(value = 0, message = "Период работы должен быть больше 0")
    @Max(value = 1000, message = "Период работы должен быть меньше 1000")
    private int workPeriod;

    @Min(value = 5000, message = "Сумма должна быть больше 5000")
    @Max(value = 100000000, message = "Сумма должна быть меньше 100000000")
    private long desiredCreditAmount;

    public ClientEntity parseEntityFromForm(ClientEntity client) {
        client.setFullName(this.getFullName());
        client.setPassportSerial(this.getPassportSerial());
        client.setPassportNumber(this.getPassportNumber());
        client.setMaritalStatus(this.getMaritalStatus());
        client.setRegistrationAddress(this.getRegistrationAddress());
        client.setContactNumber(this.getContactNumber());
        client.setCompanyName(this.getCompanyName());
        client.setPost(this.getPost());
        client.setWorkPeriod(this.getWorkPeriod());

        return client;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassportSerial() {
        return passportSerial;
    }

    public void setPassportSerial(String passportSerial) {
        this.passportSerial = passportSerial;
    }

    public String getPassportNumber() {
        return passportNumber;
    }

    public void setPassportNumber(String passportNumber) {
        this.passportNumber = passportNumber;
    }

    public boolean getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(boolean maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getRegistrationAddress() {
        return registrationAddress;
    }

    public void setRegistrationAddress(String registrationAddress) {
        this.registrationAddress = registrationAddress;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public int getWorkPeriod() {
        return workPeriod;
    }

    public void setWorkPeriod(int workPeriod) {
        this.workPeriod = workPeriod;
    }

    public long getDesiredCreditAmount() {
        return desiredCreditAmount;
    }

    public void setDesiredCreditAmount(long desiredCreditAmount) {
        this.desiredCreditAmount = desiredCreditAmount;
    }
}
