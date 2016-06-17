package orderexercise;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.constraints.Null;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


public class ProductFormValidator implements Validator {

	@Override
	public boolean supports(Class<?> paramClass) {
		return Product.class.equals(paramClass);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		
		Product product = (Product) obj;
		
		
		
		 Pattern pattern;
		 Matcher matcher;
		 String ID_PATTERN = "[0-9]+";
	
			   pattern = Pattern.compile(ID_PATTERN);
			   matcher = pattern.matcher(product.getPrice()+"");
			   if (!matcher.matches()) {
				   System.out.println("match");
			    errors.rejectValue("id", "id.incorrect",
			      "Enter a numeric value");
			   }else{
				   System.out.println("un match");
			   }
		 
		
		
		
		
		
				
		if(product.getPrice() < 0){
			//errors.rejectValue("price", "negativeValue", new Object[]{"'price'"}, "price can't be negative.");
			errors.rejectValue("price", "price.negative");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "name.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "price.required");
	}
}