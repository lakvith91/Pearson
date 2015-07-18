package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_005fpage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("     <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("    <meta name=\"author\" content=\"\">\r\n");
      out.write("\r\n");
      out.write("    <title>Home Page</title>\r\n");
      out.write("\r\n");
      out.write("    <!-- Bootstrap Core CSS -->\r\n");
      out.write("             <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("             <link href=\"css/bootstrap-responsive.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Custom CSS -->\r\n");
      out.write("   <link href=\"css/homepage.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->\r\n");
      out.write("    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\r\n");
      out.write("    <!--[if lt IE 9]>\r\n");
      out.write("        <script src=\"js/html5shiv.js\"></script>\r\n");
      out.write("        <script src=\"js/respond.min.js\"></script>\r\n");
      out.write("    <![endif]-->\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("function btntest_onclick() \r\n");
      out.write("{\r\n");
      out.write("    window.location.href = \"home_page_claim_add.jsp\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("    <!-- Navigation -->\r\n");
      out.write("    <nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\" style=\"height:65px;\">\r\n");
      out.write("        \r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("           \r\n");
      out.write("\t         <div class=\"navbar-header\">\r\n");
      out.write("                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\r\n");
      out.write("                    <span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("                    <span class=\"icon-bar\"></span>\r\n");
      out.write("                </button>\r\n");
      out.write("               \t<img src=\"images/PEARSON_logo_1.png\" alt=\"Company Logo\" >\r\n");
      out.write("             </div>\r\n");
      out.write("            \r\n");
      out.write("            <!-- Collect the nav links, forms, and other content for toggling -->\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"collapse navbar-collapse pull-right\" id=\"bs-example-navbar-collapse-1\" style=\"margin-top:8px;\">\r\n");
      out.write("            \t\r\n");
      out.write("              <ul class=\"nav navbar-nav\">\r\n");
      out.write("                     <li>\r\n");
      out.write("                     <a href=\"#\"> <h3 class=\"navigation_heading\" > <span class=\"glyphicon glyphicon-user\"></span> &nbsp;Emp Name </h3> </a>\r\n");
      out.write("                    </li>     \r\n");
      out.write("         \r\n");
      out.write("                    <li>\r\n");
      out.write("                     <a href=\"home_page.html\"> <h3 class=\"navigation_heading \" > <span class=\"glyphicon glyphicon-home\"></span> &nbsp;Home </h3> </a>\r\n");
      out.write("                    </li>\r\n");
      out.write("       \r\n");
      out.write("\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t <a href=\"index.html\"> <h3  class=\"navigation_heading\"> Sign Out  </h3> </a>\r\n");
      out.write("   \r\n");
      out.write("\t\t\t\t\t </li>\r\n");
      out.write("\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("            <!--navbar-collapse -->\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- /.container -->\r\n");
      out.write("    </nav>\r\n");
      out.write("\r\n");
      out.write("    <!-- Page Content -->\r\n");
      out.write("    \r\n");
      out.write("    <div class=\"container\" style=\"margin-top:30px;\">\r\n");
      out.write("\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("\r\n");
      out.write("            <div class=\"col-md-3\" > <!--news feed column -->\r\n");
      out.write("\t\t\t\t<div class=\"thumbnail\" > <!--for boader -->\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<p class=\"lead marginedit\">News Feed</p>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div class=\"dropdown\">\r\n");
      out.write("  \t\t\t\t\t\t\t<button  class=\"btn btn-primary button marginedit  \"  id=\"dLabel\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" role=\"button\" aria-expanded=\"false\">\r\n");
      out.write("    \t\t\t\t\t\t\tNotification&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("    \t\t                    <span class=\"glyphicon glyphicon-envelope\" ></span>   <!-- Noticication message icon -->\r\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"badge\" style=\"margin-left:65px;\">2+</span>\r\n");
      out.write("\t\t\t\t\t\t\t    <span class=\"caret\"></span>\r\n");
      out.write("  \t\t\t\t\t\t\t</button>\r\n");
      out.write("  \t\t\t\t\t\t\t<ul class=\"dropdown-menu\" role=\"menu\" aria-labelledby=\"dLabel\">\r\n");
      out.write("    \t\t\t\t\t\t\t<li> Notification 1</li>\r\n");
      out.write("    \t\t\t\t\t\t\t<li> Notification 2</li>\r\n");
      out.write("    \t\t\t\t\t\t\t<li> Notification 3</li>\r\n");
      out.write("    \t\t\t\t\t\t\t<li> Notification 4</li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" \t\t\t\t\t\t\t </ul>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t <!--\t\t\t\t\t\r\n");
      out.write("\t\t                <div class=\"list-group marginedit\">\r\n");
      out.write("\t\t                    <a href=\"home_page_manger_view.html\" class=\"list-group-item active\">\r\n");
      out.write("\t\t                    \tNotification &nbsp;&nbsp;\r\n");
      out.write("\t\t                    \t<span class=\"glyphicon glyphicon-envelope\"></span>   <!-- Noticication message icon -->\r\n");
      out.write("\t\t <!--\t\t\t\t\t\t\t<span class=\"badge\">2+</span>\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t                 </div>\r\n");
      out.write(" <!--\t\t                 <div class=\"list-group marginedit\">\r\n");
      out.write("\t\t                    <a href=\"#\" class=\"list-group-item active\">\r\n");
      out.write("\t\t                    \tComment &nbsp;&nbsp;&nbsp;\r\n");
      out.write("\r\n");
      out.write("\t\t                    \t<span class=\"glyphicon glyphicon-comment\"></span>   <!-- Noticication message icon -->\r\n");
      out.write(" <!--\t\t\t\t\t\t\t\t\t<span class=\"badge\">4+</span>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t                 </div>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t -->\r\n");
      out.write("\r\n");
      out.write("\t\t                <div class=\"list-group marginedit\">\r\n");
      out.write("\t\t                    <a href=\"home_page_edit_profile.html\" class=\"list-group-item active\">\r\n");
      out.write("\t\t                    \tEdit Profile &nbsp;&nbsp;\r\n");
      out.write("\t\t                    \t<span class=\"glyphicon glyphicon-cog\"></span>   <!-- Noticication message icon -->\r\n");
      out.write("\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t                 </div>\r\n");
      out.write("\t\t\t\t </div><!-- for thumbnail-->\r\n");
      out.write("\t\t\t\t <div class=\"thumbnail\" style=\"margin-top:100px;\">\r\n");
      out.write("\t                 <div class=\"btn width-btn\">\r\n");
      out.write("\t                 \t<button type=\"button\" class=\"btn btn-success button width-btn  \"   value=\"Check\"  onclick=\"return btntest_onclick()\"><!-- login button of login popup window -->\r\n");
      out.write("\t\t\t\t\t\t<span class=\"glyphicon glyphicon-info-sign\"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;New Claim</button>\r\n");
      out.write("                      </div>\r\n");
      out.write("                                       \r\n");
      out.write("\t                 <div class=\"btn width-btn\" >\r\n");
      out.write("\t                 \t<button type=\"button\" class=\"btn btn-danger button width-btn  \" ><!-- login button of login popup window -->\r\n");
      out.write("\t\t\t\t\t\t<span class=\"glyphicon glyphicon-th\"></span>&nbsp;Claim History</button>\r\n");
      out.write("                      </div>\r\n");
      out.write("                  </div>    \r\n");
      out.write("                      \r\n");
      out.write("              </div><!-- for col md 3-->  \r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"col-md-9\">  <!-- image field column-->\r\n");
      out.write("\r\n");
      out.write("               <!-- <div class=\"thumbnail\">\r\n");
      out.write("                    <img class=\"img-responsive \" src=\"images/service-charge_1921783b.jpg\" alt=\" home page image\">\r\n");
      out.write("                   <!-- <div class=\"caption-full\">--> \r\n");
      out.write("               <!--  </div><!-- for thumbnail-->\r\n");
      out.write("                 \r\n");
      out.write("                 \r\n");
      out.write("                 \r\n");
      out.write("                 <div id=\"carousel-example-generic\" class=\"carousel slide\" data-ride=\"carousel\" data-interval=\"3000\">\r\n");
      out.write("\t\t\t\t\t\t\t  <!-- Indicators -->\r\n");
      out.write("\t\t\t\t\t\t\t  <ol class=\"carousel-indicators\">\r\n");
      out.write("\t\t\t\t\t\t\t    <li data-target=\"#carousel-example-generic\" data-slide-to=\"0\" class=\"active\"></li>\r\n");
      out.write("\t\t\t\t\t\t\t    <li data-target=\"#carousel-example-generic\" data-slide-to=\"1\"></li>\r\n");
      out.write("\t\t\t\t\t\t\t    <li data-target=\"#carousel-example-generic\" data-slide-to=\"2\"></li>\r\n");
      out.write("\t\t\t\t\t\t\t  </ol>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t  <!-- Wrapper for slides -->\r\n");
      out.write("\t\t\t\t\t\t\t  <div class=\"carousel-inner\">\r\n");
      out.write("\t\t\t\t\t\t\t    <div class=\"item active\">\r\n");
      out.write("\t\t\t\t\t\t\t      <img src=\"images/1680x1050_Widescreen_Wallpaper_Strange_World_I.jpg\" alt=\"...\">\r\n");
      out.write("\t\t\t\t\t\t\t      <div class=\"carousel-caption\">\r\n");
      out.write("\t\t\t\t\t\t\t      \t<h3 style=\"font-size:30px;\">Pearson Claim Management System</h3>\r\n");
      out.write("\t\t\t\t\t\t\t      </div>\r\n");
      out.write("\t\t\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t\t\t\t    <div class=\"item\">\r\n");
      out.write("\t\t\t\t\t\t\t      <img src=\"images/05.jpg\" alt=\"...\">\r\n");
      out.write("\t\t\t\t\t\t\t      <div class=\"carousel-caption\">\r\n");
      out.write("\t\t\t\t\t\t\t      \t<h3 style=\"font-size:30px;\">Pearson Claim Management System</h3>\r\n");
      out.write("\t\t\t\t\t\t\t      </div>\r\n");
      out.write("\t\t\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t\t\t\t    <div class=\"item\">\r\n");
      out.write("\t\t\t\t\t\t\t      <img src=\"images/comic-bridge_wallpapers_7073_1680x1050.jpg\" alt=\"...\">\r\n");
      out.write("\t\t\t\t\t\t\t      <div class=\"carousel-caption\">\r\n");
      out.write("\t\t\t\t\t\t\t      \t<h3 style=\"font-size:30px;\">Pearson Claim Management System</h3>\r\n");
      out.write("\t\t\t\t\t\t\t      </div>\r\n");
      out.write("\t\t\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t\t\t\t  </div>\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t  <!-- Controls -->\r\n");
      out.write("\t\t\t\t\t\t\t  <a class=\"left carousel-control\" href=\"#carousel-example-generic\" role=\"button\" data-slide=\"prev\">\r\n");
      out.write("\t\t\t\t\t\t\t    <span class=\"glyphicon glyphicon-chevron-left\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t  </a>\r\n");
      out.write("\t\t\t\t\t\t\t  <a class=\"right carousel-control\" href=\"#carousel-example-generic\" role=\"button\" data-slide=\"next\">\r\n");
      out.write("\t\t\t\t\t\t\t    <span class=\"glyphicon glyphicon-chevron-right\"></span>\r\n");
      out.write("\t\t\t\t\t\t\t  </a>\r\n");
      out.write("\t\t\t\t\t\t\t</div> <!-- Carousel -->\r\n");
      out.write("                 \r\n");
      out.write("                 \r\n");
      out.write("             </div><!-- for col md 9-->  \r\n");
      out.write("          </div> <!-- for row-->          \r\n");
      out.write("      </div>   <!-- for container-->      \r\n");
      out.write("         \r\n");
      out.write("     \r\n");
      out.write("  \r\n");
      out.write("    \r\n");
      out.write("    <script src=\"js/jquery.js\" type=\"text/javascript\"></script>\r\n");
      out.write("\r\n");
      out.write("    <!-- Bootstrap Core JavaScript -->\r\n");
      out.write("    <script src=\"js/bootstrap.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
