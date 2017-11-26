<%@page import="dal.dbConnection"%>
<%@page import="ecommerce.database.ProductIO"%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
            System.out.println(path);
            System.out.println(basePath);
            System.out.println(request.getQueryString());
            System.out.println(request.getRequestURI());

            session.setAttribute("reqstr", request.getQueryString());

            session.setAttribute("prodid", request.getParameter("PID"));


        %>
    </head>
    <body>

        <form name="comment" method="post" action="commentSave.jsp">
            <div class="main_content" style="width: 95%; left: 10px">
                <div style="padding: 5px; width: 95%; height: 75px; text-align: left; margin: 10px;
                     border: 1px solid rgb(204, 204, 204);">
                    <table border="0" cellpadding="0" cellspacing="0" class="tabdata" width="100%">
                        <tr>
                            <%                                String flag = "NA";
                                int postivevalue = 0;
                                int negativevalue = 0;
                                int mixvalue = 0;
                                //p=(p*100)/(p+n+m)
                                // string select sum(commentvalue) from comment_nlp where commentvalue>0

                                Connection con1 = null;
                                Statement st = null;
                                ResultSet rs = null;
                                try {
                                    String sqlp = "select count(commentValue) as postive from comments_nlp where commentValue>0 and item_id=" + request.getParameter("PID");
                                    String sqlm2 = "select count(commentValue) as mixed from comments_nlp where commentValue=0 and item_id=" + request.getParameter("PID");
                                    String sqln3 = "select count(commentValue) as negtive from comments_nlp where commentValue<0 and item_id=" + request.getParameter("PID");

                                    postivevalue = dbConnection.getCommentValue(sqlp);
                                    System.out.println(sqlp);
                                    mixvalue = dbConnection.getCommentValue(sqlm2);
                                    System.out.println(sqlm2);
                                    negativevalue = dbConnection.getCommentValue(sqln3);
                                    System.out.println(sqln3);
                                } catch (Exception dd) {
                                } finally {

                                }

                            %>

                            <td align="right" style="width: 12px">
                                Positive:
                            </td>
                            <td>
                                <span id="Span1" >
                                    <img id="Img1"  alt="" height="15" style="width: <%=postivevalue%>%;" src="images/slider_bar.jpg" />
                                    <span id="yourscore" > <%=postivevalue%></span> </span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" height="10">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 12px">
                                Mixed:
                            </td>
                            <td>
                                <span id="Span2" >
                                    <img id="Img2"  alt="" height="15" style="width:<%=mixvalue%>%;" src="images/m.jpg" />
                                    <span id="BestScore" ><%=mixvalue%></span> </span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" height="10">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 12px">
                                Negative:
                            </td>
                            <td>
                                <span id="Span3" >
                                    <img id="Img3"  style="width: <%=negativevalue%>%;" alt="" height="15" src="images/n.jpg" />
                                    <span id="Span4" ><%=negativevalue%></span> </span>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="post-content">

                    <table width="97%">
                        <%                            String msg = null;
                            msg = (String) session.getAttribute("msg");
                            if (msg != null) {
                        %>
                        <tr>
                            <td colspan="8" align="center" style="font-size: 19px;color:white;font-weight: bold;">
                                <%=msg%>
                            </td>
                        </tr>
                        <%
                                session.removeAttribute("msg");
                            }
                        %>
                        <br/>
                        <tr>
                            <td colspan="2" align="left">
                                Comments  
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <textarea cols="26" rows="3" placeholder="Give your Reviews here. The comment Should be full sentances(USA formate)..................."   Height="115px" style="height: 115px; width: 100%"     name="txtmsa" id="txtmsa"></textarea>

                                <br />
                                <span>(where Pos=Positive1 Comment, Neg=Negative Comment, NA=Neutral Comment) </span>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <input type="submit" value="Submit"  >
                                <input type="reset" value="Reset">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="content-node content">
                                    <div style="background: white; width: 98%; padding: -1px 5px 5px;  float: left; border: solid 2px #CCC;
                                         margin: 4px; height: auto;" >
                                        <%
                                            con1 = null;
                                            st = null;
                                            rs = null;
                                            String sql = "SELECT comments_nlp.user_id, users.UserFirstName,item_id,comments,commentValue,com_date FROM  comments_nlp  LEFT OUTER JOIN  users ON users.UserID = comments_nlp.user_id WHERE item_id=" + request.getParameter("PID") + " ORDER BY com_date DESC";
                                            try {
                                                con1 = dbConnection.makeCon();
                                                st = con1.createStatement();
                                                rs = st.executeQuery(sql);

                                        %>

                                        <div style="height: 35px; text-align:center; vertical-align:middle; background: -moz-linear-gradient(center top , rgb(118, 118, 118) 0px, rgb(47, 47, 47) 29px) repeat scroll 0 0 rgba(0, 0, 0, 0);
                                             border-color: rgb(51, 51, 51); border-width: 1px; ">

                                            <span style=" display: inline; 
                                                  float: left;
                                                  font-size: 16px;
                                                  font-weight: bold;
                                                  color: #FFFFFF;
                                                  line-height: 19px;">User Review </span>
                                        </div>
                                        <%  while (rs.next()) { %>

                                        <div style="-moz-border-radius: 10px; -webkit-border-radius: 10px; border-radius: 10px;
                                             border: solid 1px #CCC; width: 99%; min-height:100px;  max-height: auto; overflow: auto; clear:both;  margin: 2px; 
                                             padding: 1px 1px 1px 1px">

                                            <div style="width: 30px; float: left; height: 39px;">
                                                <div id="divpoint" style="font-size: 15px;  line-height: 28px; width: 28px;
                                                     background-color: rgb(102, 204, 51); -moz-border-radius: 10px; -webkit-border-radius: 10px;
                                                     border-radius: 20px; border: 0px solid; text-align: center;">
                                                    <% if (rs.getInt("commentValue") > 0) {
                                                            flag = "Pos";

                                                        } else if (rs.getInt("commentValue") < 0) {
                                                            flag = "Neg";
                                                        } else {
                                                            flag = "NA";
                                                        }
                                                    %>
                                                    <%=flag%>

                                                </div>
                                            </div>

                                            <div style="float: left; min-width:200px; text-align: justify;  width: 95%; padding: 1px 0px 10px 5px; font-size: 12px; color: #636363;
                                                 height: auto; overflow:auto;">
                                                <table width="100%">
                                                    <tr>
                                                        <td>
                                                            <span><b> <%=rs.getString("UserFirstName").toString()%> </b></span>
                                                        </td>
                                                        <td align="right">
                                                            <span><%=rs.getString("com_date").toString()%></span>
                                                        </td>
                                                    </tr>

                                                    </tr>
                                                </table>

                                                <%=rs.getString("comments").toString()%>        

                                                <!--....&nbsp;<a
                                          href="#" style="color: Maroon; font-size: 14px;">Read More</a> -->
                                            </div>

                                        </div>

                                        <%  }
                                            } catch (Exception e) {

                                            }
                                        %>








                                    </div>


                                </div> 


                            </td>
                        </tr>

                    </table>                ﻿

                    <!--end-->
                </div>
                <!--end post-content-->
            </div>
        </form>
    </body>
</html>
