package Servlet;

import Model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội","https://www.elle.vn/wp-content/uploads/2017/08/18/angelina-jolie-1024x1346.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang","https://www.elle.vn/wp-content/uploads/2017/08/18/galgadot-nu-dien-vien-Hollywood-1024x1280.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hoà", "1983-08-22", "Nam Định","https://genk.mediacdn.vn/2019/3/12/photo-1-15523663274491725239366.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây","https://toplist.vn/images/800px/anne-hathaway-53718.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội","https://media.ohay.tv/v1/content/2015/03/unnamed-10-ohay-tv-280.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("/customerList.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
