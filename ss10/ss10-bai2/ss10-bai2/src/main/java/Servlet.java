import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Servlet", value = "/calculator")
public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Integer.parseInt(request.getParameter("first-operand"));
        float secondOperand = Integer.parseInt(request.getParameter("second-operand"));
        String operator = request.getParameter("operator");
        try{
            float result = Calculator.calculate(operator , firstOperand,secondOperand);
            request.setAttribute("result" , result);
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }catch (Exception e){
            request.getRequestDispatcher("exception.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
