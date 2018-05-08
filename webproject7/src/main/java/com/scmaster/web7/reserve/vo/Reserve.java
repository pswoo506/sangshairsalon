package com.scmaster.web7.reserve.vo;

public class Reserve {
	private int reservenum;
	private String id;
	private String reservedate; //예약날짜
	private String hairstyle; //머리스타일
	private String designer; //디자이너	
	private String reservetime; //예약시간
	private String requesttext; //요청사항
	
	public Reserve(){
		super();
	}
	
	public Reserve(int reservenum, String id, String reservedate, String hairstyle, String designer, String reservetime, String requesttext){
		this.reservenum=reservenum;
		this.id=id;
		this.reservedate=reservedate;
		this.hairstyle=hairstyle;
		this.designer=designer;
		this.reservetime=reservetime;
		this.requesttext=requesttext;
	}

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getReservenum() {
		return reservenum;
	}

	public void setReservenum(int reservenum) {
		this.reservenum = reservenum;
	}

	public String getReservedate() {
		return reservedate;
	}

	public void setReservedate(String reservedate) {
		this.reservedate = reservedate;
	}

	public String getHairstyle() {
		return hairstyle;
	}

	public void setHairstyle(String hairstyle) {
		this.hairstyle = hairstyle;
	}

	public String getDesigner() {
		return designer;
	}

	public void setDesigner(String designer) {
		this.designer = designer;
	}

	public String getReservetime() {
		return reservetime;
	}

	public void setReservetime(String reservetime) {
		this.reservetime = reservetime;
	}

	public String getRequesttext() {
		return requesttext;
	}

	public void setRequesttext(String requesttext) {
		this.requesttext = requesttext;
	}

	@Override
	public String toString() {
		return "Reserve [reservenum=" + reservenum + ", id=" + id + ", reservedate=" + reservedate + ", hairstyle="
				+ hairstyle + ", designer=" + designer + ", reservetime=" + reservetime + ", requesttext=" + requesttext
				+ "]";
	}

	
}
