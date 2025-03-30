package controller;

import BeanProcess.VulnerabilityPro;
import model.Vulnerability;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ApprovedVulnerabilitiesServlet")
public class ApprovedVulnerabilitiesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ApprovedVulnerabilitiesServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ApprovedVulnerabilitiesServlet start: ");
        VulnerabilityPro vulnerabilityPro = new VulnerabilityPro();
        List<Vulnerability> vulnerabilities = vulnerabilityPro.getApprovedVulnerabilities();

        request.setAttribute("result", vulnerabilities);
        request.getRequestDispatcher("auditorfiles/listApprovedVulnerabilities.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
