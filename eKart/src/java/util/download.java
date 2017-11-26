///*
// * To change this template, choose Tools | Templates
// * and open the template in the editor.
// */
//
//package util;
//protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
//    String remoteImageUrl = request.getParameter("remoteImageUrl");
//    String imageUrl = "http://localhost:8000/WEBAPP/images/download.png";
//
//    URL url = new URL(remoteImageUrl);
//    HttpURLConnection http = (HttpURLConnection)url.openConnection();
//    int statusCode = http.getResponseCode();
//
//    if (statusCode != 200) {
//        imageUrl = "http://localhost:8000/WEBAPP/images/notAvailable.png";
//    }
//
//    response.getWriter().write(imageUrl);
//}