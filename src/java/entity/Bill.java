package entity;
import entity.Account;
import java.sql.Date;

public class Bill {

    int bill_id;
    Account account;
    Float total;
    String payment;
    String address;
    Date date;
    int phone;

    public Bill() {
    }

    public Bill(int bill_id, Account account, Float total, String payment, String address, Date date, int phone) {
        this.bill_id = bill_id;
        this.account = account;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.date = date;
        this.phone = phone;
    }

    public Bill(int bill_id, Float total, Date date) {
        this.bill_id = bill_id;
        this.total = total;
        this.date = date;
    }

    public Bill(int bill_id, Float total, String payment, String address, Date date, int phone) {
        this.bill_id = bill_id;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.date = date;
        this.phone = phone;
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public Account getAccount() {
        return account;
    }

    public void setUser(Account account) {
        this.account = account;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

}
