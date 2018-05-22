<%-- 
    Document   : customers
    Created on : 21/05/2018, 20:47:51
    Author     : a
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.db.Customer"%>
<%@page import="br.com.fatecpg.db.SampleConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JavaDB WebApp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h2>Todos os meus adoráveis clientes</h2>
        <div>
            <%
                ArrayList<Customer> list = null;
                try {
                    list = SampleConnector.getCustomers();
                }catch(Exception ex){
                    out.println("Erro: "+ex.getMessage());
                }
                %>
                <table border="1">
                    <tr><th>ID</th><th>Nome</th><th>Limite de crédito</th></tr>
                <%for(Customer c:list){%>
                <tr><td><%=c.getId()%></td><td><%=c.getName()%></td><td><%=c.getCreditLimit()%></td></tr>
                <%}%>
                </table>
        </div>
    </body>
</html>
