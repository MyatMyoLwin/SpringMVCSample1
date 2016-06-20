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
				
		if(product.getPrice() < 0){
			//errors.rejectValue("price", "negativeValue", new Object[]{"'price'"}, "price can't be negative.");
			errors.rejectValue("price", "price.negative");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "name.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "price.required");
	}
}