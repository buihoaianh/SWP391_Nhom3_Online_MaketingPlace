/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


public class Feedbacks {
    private int FeedbackID;
    private int AccountID;
    private String FeedbackText;
    private int Rating;
    private Timestamp CreateFeedbackDate;
    private int ProductVariantID;
    private int POrderID;
    private int Status;
    private List<String> imageUrls = new ArrayList<>();

    public Feedbacks() {
    }

    public Feedbacks(int FeedbackID, int AccountID, String FeedbackText, int Rating, Timestamp CreateFeedbackDate, int ProductVariantID, int POrderID, int Status) {
        this.FeedbackID = FeedbackID;
        this.AccountID = AccountID;
        this.FeedbackText = FeedbackText;
        this.Rating = Rating;
        this.CreateFeedbackDate = CreateFeedbackDate;
        this.ProductVariantID = ProductVariantID;
        this.POrderID = POrderID;
        this.Status = Status;
    }

    
    
    public Feedbacks(int FeedbackID, int AccountID, String FeedbackText, int Rating, Timestamp CreateFeedbackDate, int ProductVariantID, int POrderID) {
        this.FeedbackID = FeedbackID;
        this.AccountID = AccountID;
        this.FeedbackText = FeedbackText;
        this.Rating = Rating;
        this.CreateFeedbackDate = CreateFeedbackDate;
        this.ProductVariantID = ProductVariantID;
        this.POrderID = POrderID;
    }

<<<<<<< Updated upstream
=======
    
    
>>>>>>> Stashed changes
    public List<String> getImageUrls() {
        return imageUrls;
    }

    public void setImageUrls(List<String> imageUrls) {
        this.imageUrls = imageUrls;
    }
<<<<<<< Updated upstream
=======
    
    
>>>>>>> Stashed changes

    public int getFeedbackID() {
        return FeedbackID;
    }

    public void setFeedbackID(int FeedbackID) {
        this.FeedbackID = FeedbackID;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public String getFeedbackText() {
        return FeedbackText;
    }

    public void setFeedbackText(String FeedbackText) {
        this.FeedbackText = FeedbackText;
    }

    public int getRating() {
        return Rating;
    }

    public void setRating(int Rating) {
        this.Rating = Rating;
    }

    public Timestamp getCreateFeedbackDate() {
        return CreateFeedbackDate;
    }

    public void setCreateFeedbackDate(Timestamp CreateFeedbackDate) {
        this.CreateFeedbackDate = CreateFeedbackDate;
    }

    public int getProductVariantID() {
        return ProductVariantID;
    }

    public void setProductVariantID(int ProductVariantID) {
        this.ProductVariantID = ProductVariantID;
    }

    public int getPOrderID() {
        return POrderID;
    }

    public void setPOrderID(int POrderID) {
        this.POrderID = POrderID;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }
    
    
    
    
}
