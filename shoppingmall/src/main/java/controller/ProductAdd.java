package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shopping.vo.products.Products;

import dao.ProductsDAO;


@WebServlet(name = "ProductAdd", value = "/ProductAdd")
public class ProductAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String appPath = request.getServletContext().getRealPath("");
        System.out.println("appPath = " + appPath);

        String path = appPath + "upload";
        System.out.println("path = " + path);
        String uploadedUrl = request.getServletContext().getRealPath(path);

        int size = 1024 * 1024 * 10; // 10M

        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
        Enumeration files = multi.getFileNames();
        String name = (String) files.nextElement();
        String file = multi.getFilesystemName(name); // 파일명

        System.out.println("multi : " + multi.getParameter("proId"));
        System.out.println("request : " + request.getParameter("proId"));

        Products product = new Products();
        product.setProId(multi.getParameter("proId"));
        product.setProName(multi.getParameter("proName"));
        product.setUnitPrice(Integer.parseInt(multi.getParameter("unitPrice")));
        product.setDescription(multi.getParameter("description"));
        product.setManufacturer(multi.getParameter("manufacturer"));
        product.setCategory(multi.getParameter("category"));
        product.setNoOfStock(Integer.parseInt(multi.getParameter("noOfStock")));
        product.setFileName(file);

        ProductsDAO dao = ProductsDAO.getInstance();

        int result = dao.insertProduct(product);
        System.out.println("result = " + result);
        						
        response.sendRedirect("/shoppingmall/SelectAll");
    }
}
