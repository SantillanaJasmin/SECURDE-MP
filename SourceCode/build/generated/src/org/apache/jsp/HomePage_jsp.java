package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class HomePage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
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
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("        <title>Home Page</title>\n");
      out.write("\n");
      out.write("        <!-- Bootstrap core CSS -->\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            img {\n");
      out.write("                height: auto;\n");
      out.write("                width: auto;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <div class=\"navbar-wrapper\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <!-- NAVBAR\n");
      out.write("                ================================================== -->\n");
      out.write("                <nav class=\"navbar navbar-inverse navbar-fixed-top\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <div class=\"navbar-header\">\n");
      out.write("                            <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar\" aria-expanded=\"false\" aria-controls=\"navbar\">\n");
      out.write("                                <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                                <span class=\"icon-bar\"></span>\n");
      out.write("                                <span class=\"icon-bar\"></span>\n");
      out.write("                                <span class=\"icon-bar\"></span>\n");
      out.write("                            </button>\n");
      out.write("                            <a class=\"navbar-brand\" href=\"#\">Project name</a>\n");
      out.write("                        </div>\n");
      out.write("                        <div id=\"navbar\" class=\"collapse navbar-collapse\">\n");
      out.write("                            <ul class=\"nav navbar-nav\">\n");
      out.write("                                <li class=\"active\"><a href=\"#\">Home</a></li>\n");
      out.write("                                <li><a href=\"#about\">About</a></li>\n");
      out.write("                                <li><a href=\"#contact\">Contact</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                            <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                                <button type=\"button\" class=\"btn btn-primary navbar-btn\">Sign in</button>\n");
      out.write("                            </ul>\n");
      out.write("                        </div><!--/.nav-collapse -->\n");
      out.write("                    </div>\n");
      out.write("                </nav>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <br/>\n");
      out.write("        <div class=\"jumbotron\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\" id=\"front\">\n");
      out.write("                    <div class=\"col-md-8\">\n");
      out.write("                        <h1>What is WeMeet?</h1>\n");
      out.write("                        <p>Power could be defined as the capacity to do something. A person has power when s/he can achieve something, and that something could either be bad or good, right or wrong. All persons have potential power, in that all have the capacity to do/ achieve something.</p><br/>\n");
      out.write("                        <p><a class=\"btn btn-success btn-lg\" href=\"SignUp.jsp\" role=\"button\">Get started by creating your own profile &raquo;</a></p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <!-- FOOTER -->\n");
      out.write("        <br>\n");
      out.write("        <footer>\n");
      out.write("            <p class=\"pull-right\"><a href=\"#\">Back to top</a></p>\n");
      out.write("            <p>&copy; 2016 Company, Inc. &middot; <a href=\"#\">Privacy</a> &middot; <a href=\"#\">Terms</a></p>\n");
      out.write("        </footer>\n");
      out.write("\n");
      out.write("        <!-- Bootstrap core JavaScript\n");
      out.write("        ================================================== -->\n");
      out.write("        <!-- Placed at the end of the document so the pages load faster -->\n");
      out.write("        <script src=\"js/jquery.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
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
