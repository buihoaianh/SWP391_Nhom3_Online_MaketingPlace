/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Member {
    private int MemberID;
    private String MemberName;
    private String MinAmount;
    private String MaxAmount;
    private String Description;
    private String ImageURL;

    public Member() {
    }

    public Member(int MemberID, String MemberName, String MinAmount, String MaxAmount, String Description, String ImageURL) {
        this.MemberID = MemberID;
        this.MemberName = MemberName;
        this.MinAmount = MinAmount;
        this.MaxAmount = MaxAmount;
        this.Description = Description;
        this.ImageURL = ImageURL;
    }

    public int getMemberID() {
        return MemberID;
    }

    public void setMemberID(int MemberID) {
        this.MemberID = MemberID;
    }

    public String getMemberName() {
        return MemberName;
    }

    public void setMemberName(String MemberName) {
        this.MemberName = MemberName;
    }

    public String getMinAmount() {
        return MinAmount;
    }

    public void setMinAmount(String MinAmount) {
        this.MinAmount = MinAmount;
    }

    public String getMaxAmount() {
        return MaxAmount;
    }

    public void setMaxAmount(String MaxAmount) {
        this.MaxAmount = MaxAmount;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getImageURL() {
        return ImageURL;
    }

    public void setImageURL(String ImageURL) {
        this.ImageURL = ImageURL;
    }

    @Override
    public String toString() {
        return "Member{" + "MemberID=" + MemberID + ", MemberName=" + MemberName + ", MinAmount=" + MinAmount + ", MaxAmount=" + MaxAmount + ", Description=" + Description + ", ImageURL=" + ImageURL + '}';
    }

  
    
}