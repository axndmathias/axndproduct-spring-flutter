package ch.axnd.axndproduct.handlers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class ResponseHandler {
    public static ResponseEntity<Object> handleResponse(String message, HttpStatus status, Object responseObj) {
        Map<String, Object> responseMap = new HashMap<String, Object>();
        responseMap.put("message", message);
        responseMap.put("status", status.value());
        if (status == HttpStatus.OK) {
            responseMap.put("data", responseObj);
        } else {
            responseMap.put("errors", responseObj);
        }
        return new ResponseEntity<>(responseMap, status);
    }
}
