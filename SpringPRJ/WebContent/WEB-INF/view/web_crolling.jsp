<%@page import="java.util.Calendar"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  JSP에서 jsoup을 사용하기 위해 import -->

<%@ page import="org.jsoup.Jsoup"%>

<%@ page import="org.jsoup.nodes.Document"%>

<%@ page import="org.jsoup.nodes.Element"%>

<%@ page import="org.jsoup.select.Elements"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

</head>

<body>



	<%
		String menu = "";
		try{
		// 파싱할 사이트를 적어준다(해당 사이트에 대한 태그를 다 긁어옴)
		Document doc = Jsoup.connect("http://www.kopo.ac.kr/kangseo/content.do?menu=262").get();

		String[] week_array = new String[7];
		int num = 0;

		//요일 불러오기
		Calendar cal = Calendar.getInstance();
		int day_of_week = cal.get(Calendar.DAY_OF_WEEK);
		if (day_of_week == 1) {
			num = 7;
		} else if (day_of_week == 2) {
			num = 1;
		} else if (day_of_week == 3) {
			num = 2;
		} else if (day_of_week == 4) {
			num = 3;
		} else if (day_of_week == 5) {
			num = 4;
		} else if (day_of_week == 6) {
			num = 5;
		} else if (day_of_week == 7) {
			num = 6;
		}

		Elements element = doc.select("div.meal_box>table>tbody");

		
		for (Element e : element) {
			Elements day = element.select("tr");
			int a = 1;
			for (Element f : day) {
				if (num == a) {
					Elements selected_day = f.select("td");
					
					int b = 1;
					for (Element g : selected_day) {
						if(b==3){
							menu = g.text().replaceAll("<td> <span>", "").replaceAll("</span> </td>", "");
							
							break;
						}
						b++;
					}

				}
				a++;
			}
		}
		}catch(Exception e){
			menu = "메뉴불러오기 실패";
		}
	%>
<%=menu %>
</body>

</html>