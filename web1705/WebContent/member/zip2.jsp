<?xml version='1.0' encoding='utf-8' ?>
<%@page import="org.w3c.dom.Document"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String inputLine = "";
	String buffer = "";
	request.setCharacterEncoding("utf-8");

	String srchwrd = "&srchwrd=" 
	       + URLEncoder.encode(request.getParameter("srchwrd"), "utf-8");

	String ip = "http://openapi.epost.go.kr/postal/retrieveNewAdressAreaCdService/retrieveNewAdressAreaCdService/getNewAddressListAreaCd";
	ip += "?ServiceKey=HmRbsedHpEufxa17DlaA2J%2BGkSQ07R5PBWe%2FXGocw88GBk4%2FO53mQ39zKkBNoriQb31sTlx7VQk8BYN33qj0Ng%3D%3D";
	ip += "&searchSe=road" + srchwrd;

	URL url = new URL(ip);

	URLConnection connection = url.openConnection();
	connection.setRequestProperty("CONTENT-TYPE", "text/xml");
	BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));
	while ((inputLine = in.readLine()) != null) {
		buffer += inputLine.trim();
	}
	in.close();
	
	out.print(buffer);
	
%>