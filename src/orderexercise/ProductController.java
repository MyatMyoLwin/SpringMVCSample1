package orderexercise;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

	List<Product> productList;

	@Autowired
	private ProductDAL productDao;
	
	@Autowired
	@Qualifier("productValidator")
	private Validator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String initialPath() {
		return "redirect:product";
	}

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public ModelAndView showProducts(HttpServletRequest request, HttpServletResponse response) {

		productList = new ArrayList<>();
		
		try {
			productList = productDao.getAll();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		int page = 1;
		int recordsPerPage = 5;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int noOfRecords = productList.size();
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		
		int startIndex = (page - 1) * recordsPerPage;
		int lastIndex = startIndex + recordsPerPage;
		
		if(lastIndex > productList.size()){
			lastIndex = productList.size();
		}
		
		ModelAndView modelView = new ModelAndView("product");
		modelView.addObject("productList", productList.subList(startIndex, lastIndex));
		modelView.addObject("noOfPages", noOfPages);
		modelView.addObject("currentPage", page);
		return modelView;
	}

	@RequestMapping(value = "/product", method = RequestMethod.POST)
	public String addAndUpdateProduct(@ModelAttribute("product") @Validated Product product, BindingResult result,
			ModelMap model) { 
				
		if (result.hasErrors()) {
			if (product.getId() != 0) {
				return "editproduct";
			} else {
				return "addproduct";
			}
        } else {
			try {
				if (product.getId() != 0) {
					productDao.update(product);
				} else {
					productDao.add(product);
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			return "redirect:product";
		}

	}

	@RequestMapping(value = "/addproduct", method = RequestMethod.GET)
	public ModelAndView addProduct() {

		ModelAndView modelView = new ModelAndView("addproduct", "product", new Product());
		return modelView;
	}

	@RequestMapping(value = "/editproduct", method = RequestMethod.GET)
	public ModelAndView editProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int id = Integer.parseInt(request.getParameter("id"));

		Product product = findProductById(id);
		
		ModelAndView modelView = new ModelAndView("editproduct", "product", product);
		return modelView;
	}

	@RequestMapping(value = "/deleteproduct", method = RequestMethod.GET)
	public String deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int id = Integer.parseInt(request.getParameter("id"));

		Product product = findProductById(id);

		try {
			productDao.delete(product);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return "redirect:product";
	}

	private Product findProductById(int id) {

		Product product = new Product();

		for (Product p : productList) {
			if (p.getId() == id) {
				product.setId(p.getId());
				product.setName(p.getName());
				product.setPrice(p.getPrice());
			}
		}

		return product;
	}

	public boolean saveProductsToFile(File productFile) throws Exception {

		if (productFile.exists()) {
			productFile.delete();
		}

		productFile.createNewFile();
		BufferedWriter bufferedWriter = Files.newBufferedWriter(productFile.toPath(), StandardOpenOption.APPEND);

		for (Product product : productList) {
			bufferedWriter.write(product.getId() + "," + product.getName() + "," + product.getPrice());
			bufferedWriter.newLine();
		}

		bufferedWriter.close();

		return true;
	}

	@RequestMapping(value = "/downloadCSV", method = RequestMethod.GET)
	public void downloadCSV(HttpServletRequest request, HttpServletResponse response) throws Exception {

		try {
			int BUFFER_SIZE = 4096;

			String filePath = "/downloads/products.csv";

			ServletContext context = request.getServletContext();
			String appPath = context.getRealPath("");

			String fullPath = appPath + filePath;
			File downloadFile = new File(fullPath);

			if (saveProductsToFile(downloadFile)) {

				FileInputStream inputStream = new FileInputStream(downloadFile);

				String mimeType = context.getMimeType(fullPath);
				if (mimeType == null) {
					mimeType = "application/octet-stream";
				}

				response.setContentType(mimeType);
				response.setContentLength((int) downloadFile.length());

				String headerKey = "Content-Disposition";
				String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
				response.setHeader(headerKey, headerValue);

				OutputStream outStream = response.getOutputStream();

				byte[] buffer = new byte[BUFFER_SIZE];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outStream.write(buffer, 0, bytesRead);
				}

				inputStream.close();
				outStream.close();

			}

		} catch (Exception e) {

			System.out.println("Error in downloading");
			e.printStackTrace();

		}

	}

}
