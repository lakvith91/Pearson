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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("\n");
      out.write("     <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("    <title>Home Page</title>\n");
      out.write("\t\t<link rel=\"shortcut icon\" href=\"images/icon/logo.png\">\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Bootstrap Core CSS -->\n");
      out.write("             <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("             <link href=\"css/bootstrap-responsive.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("\n");
      out.write("    <!-- Custom CSS -->\n");
      out.write("   <link href=\"css/homepage.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write(" \n");
      out.write(" \n");
      out.write(" \n");
      out.write(" <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->\n");
      out.write("    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\n");
      out.write("    <!--[if lt IE 9]>\n");
      out.write("        <script src=\"js/html5shiv.js\"></script>\n");
      out.write("        <script src=\"js/respond.min.js\"></script>\n");
      out.write("    <![endif]-->\n");
      out.write("\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\">\n");
      out.write("\n");
      out.write("function btntest_onclick() \n");
      out.write("{\n");
      out.write("    window.location.href = \"home_page_claim_add.html\";\n");
      out.write("}\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\t\n");
      out.write("\n");
      out.write("\t\n");
      out.write("    <!-- Navigation -->\n");
      out.write("    <nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\" style=\"height:65px;\">\n");
      out.write("        \n");
      out.write("        <div class=\"container\">\n");
      out.write("           \n");
      out.write("\t         <div class=\"navbar-header\">\n");
      out.write("                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\n");
      out.write("                    <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                    <span class=\"icon-bar\"></span>\n");
      out.write("                </button>\n");
      out.write("               \t<img src=\"images/PEARSON_logo_1.png\" alt=\"Company Logo\" >\n");
      out.write("             </div>\n");
      out.write("            \n");
      out.write("            <!-- Collect the nav links, forms, and other content for toggling -->\n");
      out.write("            \n");
      out.write("            <div class=\"collapse navbar-collapse pull-right\" id=\"bs-example-navbar-collapse-1\" style=\"margin-top:8px;\">\n");
      out.write("            \t\n");
      out.write("              <ul class=\"nav navbar-nav\">\n");
      out.write("                     <li>\n");
      out.write("                     <a href=\"#\"> <h3 class=\"navigation_heading\" > <span class=\"glyphicon glyphicon-user\"></span> &nbsp;Emp Name </h3> </a>\n");
      out.write("                    </li>     \n");
      out.write("         \n");
      out.write("                    <li>\n");
      out.write("                     <a href=\"home_page.html\"> <h3 class=\"navigation_heading \" > <span class=\"glyphicon glyphicon-home\"></span> &nbsp;Home </h3> </a>\n");
      out.write("                    </li>\n");
      out.write("       \n");
      out.write("\t\t\t\t\t<li>\n");
      out.write("\t\t\t\t\t <a href=\"index.html\"> <h3  class=\"navigation_heading\"> Sign Out  </h3> </a>\n");
      out.write("   \n");
      out.write("\t\t\t\t\t </li>\n");
      out.write("\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <!--navbar-collapse -->\n");
      out.write("        </div>\n");
      out.write("        <!-- /.container -->\n");
      out.write("    </nav>\n");
      out.write("\n");
      out.write("    <!-- Page Content -->\n");
      out.write("    \n");
      out.write("    <div class=\"container\" style=\"margin-top:30px;\">\n");
      out.write("\n");
      out.write("        <div class=\"row\">\n");
      out.write("\n");
      out.write("            <div class=\"col-md-3\" > <!--news feed column -->\n");
      out.write("\t\t\t\t<div class=\"thumbnail\" > <!--for boader -->\n");
      out.write("\n");
      out.write("\t\t\t\t\t<p class=\"lead marginedit\">News Feed</p>\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t<div class=\"dropdown\">\n");
      out.write("  \t\t\t\t\t\t\t<button  class=\"btn btn-primary button marginedit  \"  id=\"dLabel\" type=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" role=\"button\" aria-expanded=\"false\">\n");
      out.write("    \t\t\t\t\t\t\tNotification&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("    \t\t                    <span class=\"glyphicon glyphicon-envelope\" ></span>   <!-- Noticication message icon -->\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"badge\" style=\"margin-left:65px;\">2+</span>\n");
      out.write("\t\t\t\t\t\t\t    <span class=\"caret\"></span>\n");
      out.write("  \t\t\t\t\t\t\t</button>\n");
      out.write("  \t\t\t\t\t\t\t<ul class=\"dropdown-menu\" role=\"menu\" aria-labelledby=\"dLabel\">\n");
      out.write("    \t\t\t\t\t\t\t<li> Notification 1</li>\n");
      out.write("    \t\t\t\t\t\t\t<li> Notification 2</li>\n");
      out.write("    \t\t\t\t\t\t\t<li> Notification 3</li>\n");
      out.write("    \t\t\t\t\t\t\t<li> Notification 4</li>\n");
      out.write("    \t\t\t\t\t\t\t    \t\t\t\t\t\t\t<li> Notification 1</li>\n");
      out.write("    \t\t\t\t\t\t\t<li> Notification 2</li>\n");
      out.write("    \t\t\t\t\t\t\t<li> Notification 3</li>\n");
      out.write("    \t\t\t\t\t\t\t<li> Notification 4</li>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write(" \t\t\t\t\t\t\t </ul>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t <!--\t\t\t\t\t\n");
      out.write("\t\t                <div class=\"list-group marginedit\">\n");
      out.write("\t\t                    <a href=\"home_page_manger_view.html\" class=\"list-group-item active\">\n");
      out.write("\t\t                    \tNotification &nbsp;&nbsp;\n");
      out.write("\t\t                    \t<span class=\"glyphicon glyphicon-envelope\"></span>   <!-- Noticication message icon -->\n");
      out.write("\t\t <!--\t\t\t\t\t\t\t<span class=\"badge\">2+</span>\n");
      out.write("\t\t\t\t\t\t\t</a>\n");
      out.write("\t\t                 </div>\n");
      out.write(" <!--\t\t                 <div class=\"list-group marginedit\">\n");
      out.write("\t\t                    <a href=\"#\" class=\"list-group-item active\">\n");
      out.write("\t\t                    \tComment &nbsp;&nbsp;&nbsp;\n");
      out.write("\n");
      out.write("\t\t                    \t<span class=\"glyphicon glyphicon-comment\"></span>   <!-- Noticication message icon -->\n");
      out.write(" <!--\t\t\t\t\t\t\t\t\t<span class=\"badge\">4+</span>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t</a>\n");
      out.write("\t\t                 </div>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t -->\n");
      out.write("\n");
      out.write("\t\t                <div class=\"list-group marginedit\" style=\"margin-bottom:18px;\">\n");
      out.write("\t\t                    <a href=\"home_page_edit_profile.html\" class=\"list-group-item active\" style=\"height:35px;\">\n");
      out.write("\t\t                    \tEdit Profile &nbsp;&nbsp;\n");
      out.write("\t\t                    \t<span class=\"glyphicon glyphicon-cog\"></span>   <!-- Noticication message icon -->\n");
      out.write("\t\t\t\t\t\t\t</a>\n");
      out.write("\t\t                 </div>\n");
      out.write("\t\t\t\t </div><!-- for thumbnail-->\n");
      out.write("\t\t\t\t <div class=\"thumbnail\" style=\"margin-top:100px;\">\n");
      out.write("\t\t\t\t \n");
      out.write("\t\t\t\t \t<p class=\"lead marginedit\">Event</p>\n");
      out.write("\n");
      out.write("\t                 <div class=\"btn width-btn\" style=\"margin-top:10px;\">\n");
      out.write("\t                 \t<button type=\"button\" class=\"btn btn-success button width-btn  \"   value=\"Check\"  onclick=\"return btntest_onclick()\"><!-- login button of login popup window -->\n");
      out.write("\t\t\t\t\t\t<span class=\"glyphicon glyphicon-info-sign\"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;New Claim</button>\n");
      out.write("                      </div>\n");
      out.write("                                       \n");
      out.write("\t                 <div class=\"btn width-btn\" style=\"margin-bottom:10px;\">\n");
      out.write("\t                 \t<button type=\"button\" class=\"btn btn-danger button width-btn  \" ><!-- login button of login popup window -->\n");
      out.write("\t\t\t\t\t\t<span class=\"glyphicon glyphicon-th\"></span>&nbsp;Claim History</button>\n");
      out.write("                      </div>\n");
      out.write("                  </div>    \n");
      out.write("                      \n");
      out.write("              </div><!-- for col md 3-->  \n");
      out.write("\n");
      out.write("\t\t\t<div class=\"col-md-9\">  <!-- image field column-->\n");
      out.write("\n");
      out.write("               <!-- <div class=\"thumbnail\">\n");
      out.write("                    <img class=\"img-responsive \" src=\"images/service-charge_1921783b.jpg\" alt=\" home page image\">\n");
      out.write("                   <!-- <div class=\"caption-full\">--> \n");
      out.write("               <!--  </div><!-- for thumbnail-->\n");
      out.write("                 \n");
      out.write("                 \n");
      out.write("                 \n");
      out.write("                 <div id=\"carousel-example-generic\" class=\"carousel slide\" data-ride=\"carousel\" data-interval=\"3000\">\n");
      out.write("\t\t\t\t\t\t\t  <!-- Indicators -->\n");
      out.write("\t\t\t\t\t\t\t  <ol class=\"carousel-indicators\">\n");
      out.write("\t\t\t\t\t\t\t    <li data-target=\"#carousel-example-generic\" data-slide-to=\"0\" class=\"active\"></li>\n");
      out.write("\t\t\t\t\t\t\t    <li data-target=\"#carousel-example-generic\" data-slide-to=\"1\"></li>\n");
      out.write("\t\t\t\t\t\t\t    <li data-target=\"#carousel-example-generic\" data-slide-to=\"2\"></li>\n");
      out.write("\t\t\t\t\t\t\t  </ol>\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t  <!-- Wrapper for slides -->\n");
      out.write("\t\t\t\t\t\t\t  <div class=\"carousel-inner\">\n");
      out.write("\t\t\t\t\t\t\t    <div class=\"item active\">\n");
      out.write("\t\t\t\t\t\t\t      <img src=\"images/cop-home-2.jpg\" alt=\"...\">\n");
      out.write("\t\t\t\t\t\t\t      <div class=\"carousel-caption\">\n");
      out.write("\t\t\t\t\t\t\t      \t<h3 style=\"font-size:30px;\">Pearson Claim Management System</h3>\n");
      out.write("\t\t\t\t\t\t\t      </div>\n");
      out.write("\t\t\t\t\t\t\t    </div>\n");
      out.write("\t\t\t\t\t\t\t    <div class=\"item\">\n");
      out.write("\t\t\t\t\t\t\t      <img src=\"images/serandib-leisure-tilt-fishing.jpg\" alt=\"...\">\n");
      out.write("\t\t\t\t\t\t\t      <div class=\"carousel-caption\">\n");
      out.write("\t\t\t\t\t\t\t      \t<h3 style=\"font-size:30px;\">Pearson Claim Management System</h3>\n");
      out.write("\t\t\t\t\t\t\t      </div>\n");
      out.write("\t\t\t\t\t\t\t    </div>\n");
      out.write("\t\t\t\t\t\t\t    <div class=\"item\">\n");
      out.write("\t\t\t\t\t\t\t      <img src=\"images/cop-home-1.jpg\" alt=\"...\">\n");
      out.write("\t\t\t\t\t\t\t      <div class=\"carousel-caption\">\n");
      out.write("\t\t\t\t\t\t\t      \t<h3 style=\"font-size:30px;\">Pearson Claim Management System</h3>\n");
      out.write("\t\t\t\t\t\t\t      </div>\n");
      out.write("\t\t\t\t\t\t\t    </div>\n");
      out.write("\t\t\t\t\t\t\t  </div>\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t  <!-- Controls -->\n");
      out.write("\t\t\t\t\t\t\t  <a class=\"left carousel-control\" href=\"#carousel-example-generic\" role=\"button\" data-slide=\"prev\">\n");
      out.write("\t\t\t\t\t\t\t    <span class=\"glyphicon glyphicon-chevron-left\"></span>\n");
      out.write("\t\t\t\t\t\t\t  </a>\n");
      out.write("\t\t\t\t\t\t\t  <a class=\"right carousel-control\" href=\"#carousel-example-generic\" role=\"button\" data-slide=\"next\">\n");
      out.write("\t\t\t\t\t\t\t    <span class=\"glyphicon glyphicon-chevron-right\"></span>\n");
      out.write("\t\t\t\t\t\t\t  </a>\n");
      out.write("\t\t\t\t\t\t\t</div> <!-- Carousel -->\n");
      out.write("                 \n");
      out.write("                 \n");
      out.write("             </div><!-- for col md 9-->  \n");
      out.write("          </div> <!-- for row-->          \n");
      out.write("      </div>   <!-- for container-->      \n");
      out.write("         \n");
      out.write("     \n");
      out.write("  \n");
      out.write("    \n");
      out.write("    <script src=\"js/jquery.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("    <!-- Bootstrap Core JavaScript -->\n");
      out.write("    <script src=\"js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
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