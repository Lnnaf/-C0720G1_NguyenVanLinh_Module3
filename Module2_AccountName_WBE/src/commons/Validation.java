package commons;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {
    public boolean regexNameOfCustomer(String name) {
        final String REGEX_NAME = "^([A-Z]{1}([a-z])*)(\\s[A-Z]{1}[a-z]*)*$";
        Pattern pattern = Pattern.compile(REGEX_NAME);
        Matcher matcher = pattern.matcher(name);
        return matcher.matches();
    }
    public boolean regexIDCard(String idCard) {
        final String REGEX_ID_CARD = "\\d{9}";
        Pattern pattern = Pattern.compile(REGEX_ID_CARD);
        Matcher matcher = pattern.matcher(idCard);
        return matcher.matches();
    }
    public boolean regexPhone(String phone) {
        final String REGEX_ID_CARD = "(09[0|1])+([0-9]{7})";
        Pattern pattern = Pattern.compile(REGEX_ID_CARD);
        Matcher matcher = pattern.matcher(phone);
        return matcher.matches();
    }
    public boolean regexEmail(String gender) {
        final String REGEX_EMAIL = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";
        Pattern pattern = Pattern.compile(REGEX_EMAIL);
        Matcher matcher = pattern.matcher(gender);
        return matcher.matches();
    }
}
