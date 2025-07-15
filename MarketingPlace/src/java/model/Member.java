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
    private int MemberPointID;
    private String MemberName;
    private int MinPoint;
    private int MaxPoint;
    private String Description;
    private String ImageURL;

    public Member() {
    }

    public Member(int MemberID, int MemberPointID, String MemberName, int MinPoint, int MaxPoint, String Description, String ImageURL) {
        this.MemberID = MemberID;
        this.MemberPointID = MemberPointID;
        this.MemberName = MemberName;
        this.MinPoint = MinPoint;
        this.MaxPoint = MaxPoint;
        this.Description = Description;
        this.ImageURL = ImageURL;
    }

    public int getMemberID() {
        return MemberID;
    }

    public void setMemberID(int MemberID) {
        this.MemberID = MemberID;
    }

    public int getMemberPointID() {
        return MemberPointID;
    }

    public void setMemberPointID(int MemberPointID) {
        this.MemberPointID = MemberPointID;
    }

    public String getMemberName() {
        return MemberName;
    }

    public void setMemberName(String MemberName) {
        this.MemberName = MemberName;
    }

    public int getMinPoint() {
        return MinPoint;
    }

    public void setMinPoint(int MinPoint) {
        this.MinPoint = MinPoint;
    }

    public int getMaxPoint() {
        return MaxPoint;
    }

    public void setMaxPoint(int MaxPoint) {
        this.MaxPoint = MaxPoint;
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
        return "Member{" + "MemberID=" + MemberID + ", MemberPointID=" + MemberPointID + ", MemberName=" + MemberName + ", MinPoint=" + MinPoint + ", MaxPoint=" + MaxPoint + ", Description=" + Description + ", ImageURL=" + ImageURL + '}';
    }

    
}