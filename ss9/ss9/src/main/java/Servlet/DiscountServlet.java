package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Calculator", urlPatterns = "/calculator")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        int discountPercent = Integer.parseInt(request.getParameter("discount"));
        float discount = (float) (price*discountPercent*0.01);
        float total = price - discount;
        request.setAttribute("mota",description);
        request.setAttribute("gia",price);
        request.setAttribute("ptck",discountPercent);
        request.setAttribute("ck",discount);
        request.setAttribute("tong",total);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        requestDispatcher.forward(request,response);
    }
}
