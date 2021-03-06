/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Comment {

    int commentID;
    int questionID;
    int userID;
    String content;
    String createdAt;
    User user;
    Comment replyToComment;
    int replyTo;
    int totalLike;
    boolean isLike; //determine the user already like the comment or not
    String status;
    int totalReplies;

    public int getTotalReplies() {
        return totalReplies;
    }

    public void setTotalReplies(int totalReplies) {
        this.totalReplies = totalReplies;
    }
    

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

    public int getTotalLike() {
        return totalLike;
    }

    public void setTotalLike(int totalLike) {
        this.totalLike = totalLike;
    }

    public Comment(int commentID, int questionID, User user, String content, String createdAt) {
        this.commentID = commentID;
        this.questionID = questionID;
        this.content = content;
        this.createdAt = createdAt;
        this.user = user;
    }

    public int getReplyTo() {
        return replyTo;
    }

    public void setReplyTo(int replyTo) {
        this.replyTo = replyTo;
    }

    public Comment getReplyToComment() {
        return replyToComment;
    }

    public void setReplyToComment(Comment replyToComment) {
        this.replyToComment = replyToComment;
    }

//    public Comment(int commentID, int questionID, User user, String content, String createdAt, int replyTo) {
//        this.commentID = commentID;
//        this.questionID = questionID;
//        this.content = content;
//        this.createdAt = createdAt;
//        this.user = user;
//        this.replyTo = replyTo;
//    }

    public boolean isIsLike() {
        return isLike;
    }

    public void setIsLike(boolean isLike) {
        this.isLike = isLike;
    }

//    public Comment(int commentID, int questionID, User user, String content, String createdAt, Comment replyTo, boolean isLiked) {
//        this.commentID = commentID;
//        this.questionID = questionID;
//        this.content = content;
//        this.createdAt = createdAt;
//        this.user = user;
//        this.replyToComment = replyTo;
//        this.isLike = isLiked;
//    }

    public Comment(int commentID, int questionID, User user, String content, String createdAt, Comment replyTo, boolean isLiked, int totalLike) {
        this.commentID = commentID;
        this.questionID = questionID;
        this.content = content;
        this.createdAt = createdAt;
        this.user = user;
        this.replyToComment = replyTo;
        this.isLike = isLiked;
        this.totalLike = totalLike;

    }

    public Comment(int commentID, int questionID, User user, String content, String createdAt, Comment replyTo, int totalLike) {
        this.commentID = commentID;
        this.questionID = questionID;
        this.content = content;
        this.createdAt = createdAt;
        this.user = user;
        this.replyToComment = replyTo;
        this.totalLike = totalLike;
    }
//
//    public Comment(int commentID, int questionID, User user, String content, String createdAt, Comment replyTo) {
//        this.commentID = commentID;
//        this.questionID = questionID;
//        this.content = content;
//        this.createdAt = createdAt;
//        this.user = user;
//        this.replyToComment = replyTo;
//    }

    public Comment(String content) {
        this.content = content;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

//    public Comment(int questionID, int userID, String content, String createdAt) {
//        this.questionID = questionID;
//        this.userID = userID;
//        this.content = content;
//        this.createdAt = createdAt;
//    }
//
//    public Comment(int questionID, User user, String content, String createdAt) {
//        this.questionID = questionID;
//        this.content = content;
//        this.createdAt = createdAt;
//        this.user = user;
//    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

}
