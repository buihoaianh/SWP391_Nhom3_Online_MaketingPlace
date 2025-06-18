/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;


public class Account {
    private int AccountID;
    private int RoleID;
    private String ImageURL;
    private String FullName;
    private String Email;
    private String Password;
    private String PhoneNumber;
    private String Address;
    private LocalDateTime CreateDate;
    private boolean Status;
    private String Description;
    private String remember_token;

    public Account() {
    }

    public Account(int AccountID, int RoleID, String ImageURL, String FullName, String Email, String Password, String PhoneNumber, String Address, LocalDateTime CreateDate, boolean Status, String Description, String remember_token) {
        this.AccountID = AccountID;
        this.RoleID = RoleID;
        this.ImageURL = ImageURL;
        this.FullName = FullName;
        this.Email = Email;
        this.Password = Password;
        this.PhoneNumber = PhoneNumber;
        this.Address = Address;
        this.CreateDate = CreateDate;
        this.Status = Status;
        this.Description = Description;
        this.remember_token = remember_token;
    }
    

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public int getRoleID() {
        return RoleID;
    }

    public void setRoleID(int RoleID) {
        this.RoleID = RoleID;
    }

    public String getImageURL() {
        return ImageURL;
    }

    public void setImageURL(String ImageURL) {
        this.ImageURL = ImageURL;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public LocalDateTime getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(LocalDateTime CreateDate) {
        this.CreateDate = CreateDate;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getRemember_token() {
        return remember_token;
    }

    public void setRemember_token(String remember_token) {
        this.remember_token = remember_token;
    }

    @Override
    public String toString() {
        return "Account{" + "AccountID=" + AccountID + ", RoleID=" + RoleID + ", ImageURL=" + ImageURL + ", FullName=" + FullName + ", Email=" + Email + ", Password=" + Password + ", PhoneNumber=" + PhoneNumber + ", Address=" + Address + ", CreateDate=" + CreateDate + ", Status=" + Status + ", Description=" + Description + ", remember_token=" + remember_token + '}';
    }

    
    
}
