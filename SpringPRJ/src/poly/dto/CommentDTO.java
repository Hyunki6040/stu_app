package poly.dto;

import java.util.Date;

public class CommentDTO {
	private int cno; //댓글 번호
	private int bno; //게시글 번호
	private String writer; //작성자
	private String comments; //내용
	private int liked; //좋아요 수
	private String liked_usr; //좋아요누른 회원
	private int hatred; //싫어요(삭제 요청) 수
	private String hatred_usr; //싫어요 누른 회원
	private Date reg_dt; //등록일
	
	
	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getBno() {
		return bno;
	}
	
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getLiked() {
		return liked;
	}
	public void setLiked(int liked) {
		this.liked = liked;
	}
	public String getLiked_usr() {
		return liked_usr;
	}
	public void setLiked_usr(String liked_usr) {
		this.liked_usr = liked_usr;
	}
	public int getHatred() {
		return hatred;
	}
	public void setHatred(int hatred) {
		this.hatred = hatred;
	}
	public String getHatred_usr() {
		return hatred_usr;
	}
	public void setHatred_usr(String hatred_usr) {
		this.hatred_usr = hatred_usr;
	}
	
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	

	// toString()
    @Override
    public String toString() {
        return "CommentDTO [cno="+ cno + ", bno=" + bno + ", writer=" + writer + ", comments=" + comments + ", reg_dt=" + reg_dt + 
        			", liked=" + liked + ", liked_usr=" + liked_usr + ", hatred=" + hatred +", hatred_usr=" + hatred_usr  + "]";
    }
}
