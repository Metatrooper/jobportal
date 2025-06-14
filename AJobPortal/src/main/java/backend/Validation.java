package backend;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {

	private Pattern name,email,password;
	private Matcher matcher;
	
	private static final String name_pattern="^[A-Za-z ]{3,30}$";
	private static final String email_pattern="^([a-zA-Z0-9])(([a-zA-Z0-9])*([\\._\\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\\-])+(\\.))+([a-zA-Z]{2,4})+$";
	private static final String pass_pattern="^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$";
	public Validation() {
		name=Pattern.compile(name_pattern);
		email=Pattern.compile(email_pattern);
		password=Pattern.compile(pass_pattern);
	}
	String name1="Deepak";
	public boolean nameValidate(final String name1) {
		matcher=name.matcher(name1);
		return matcher.matches();
	}
public boolean emailValidate(final String email1) {
		
	matcher=email.matcher(email1);
	return matcher.matches();
	}
public boolean passwordValidate(final String pass1) {
	
	matcher=password.matcher(pass1);
	return matcher.matches();
}

}
