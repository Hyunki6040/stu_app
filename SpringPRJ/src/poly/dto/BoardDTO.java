package poly.dto;

import java.util.Date;

public class BoardDTO {
	private int bno; //게시글 번호
	private String writer; //작성자
	private String contents; //내용
	private int liked; //좋아요 수
	private String liked_usr; //좋아요누른 회원
	private int hatred; //싫어요(삭제 요청) 수
	private String hatred_usr; //싫어요 누른 회원
	private String campus; //캠퍼스
	private Date reg_dt; //등록일
	
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	public String getCampus() {
		return campus;
	}
	public void setCampus(String campus) {
		this.campus = campus;
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
        return "BoardDTO [bno=" + bno + ", writer=" + writer + ", contents=" + contents + ", reg_dt=" + reg_dt + 
        			", liked=" + liked + ", liked_usr=" + liked_usr + ", hatred=" + hatred +", hatred_usr=" + hatred_usr + ", campus=" + campus + "]";
    }
}
