<%@page import="poly.util.CmmUtil"%>
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
	    String campus = (String)session.getAttribute("campus");
		String menu = "";
		String menu_type = CmmUtil.nvl(request.getParameter("menu_type"));
		String url = CmmUtil.nvl(request.getParameter("url"));

		try {
										// 파싱할 사이트를 적어준다(해당 사이트에 대한 태그를 다 긁어옴)
										Document doc = Jsoup.connect(url).get();

										String[] week_array = new String[7];
										int num = 0;

										//요일 불러오기
										Calendar cal = Calendar.getInstance();
										int day_of_week = cal.get(Calendar.DAY_OF_WEEK);
										if (menu_type.equals("A")) {
											if (day_of_week == 1) {
												num = 7;
											} else {
												num = day_of_week - 1;
											}
										} else {
											num = day_of_week;
										}

										Elements element = doc.select("div.meal_box>table>tbody");

										int a = 1;
										int b = 1;
										for (Element e : element) {
											Elements day = element.select("tr");
											for (Element f : day) {
												if (num == a) {
													Elements selected_day = f.select("td");

													for (Element g : selected_day) {

														String string = g.text().replaceAll("<td> <span>", "").replaceAll("</span> </td>",
																"");
														if (string.replaceAll(" ", "").length() > 0) {
															if (b == 2) {
																menu += "<p style=\"color:#F2CB61\">[조식] </p><p>" + string + "</p>";
															} else if (b == 3) {
																menu += "<p style=\"color:#F2CB61\">[중식] </p><p>" + string + "</p>";
															} else if (b == 4) {
																menu += "<p style=\"color:#F2CB61\">[석식] </p><p>" + string + "</p>";
																break;
															}
														} else {

														}
														b++;
													}

												}
												a++;
											}
										}
										if (menu.length() < 1) {
											menu += "<a href=" + url + "><p>홈페이지에 업로드된 메뉴가 없습니다.<br/>홈페이지를 확인해주세요</p></a>";
										}
									} catch (Exception e) {
										menu = "메뉴불러오기 실패(" + e + ")";
									}
							%>
<%=menu %>
</body>

</html>