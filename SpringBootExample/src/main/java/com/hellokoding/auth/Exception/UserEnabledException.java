package com.hellokoding.auth.Exception;

import org.springframework.security.core.AuthenticationException;

public class UserEnabledException extends AuthenticationException {

	public UserEnabledException(String msg) {
		super(msg);
		// TODO Auto-generated constructor stub
	}

	public UserEnabledException(String msg, Throwable t) {
		super(msg, t);
		// TODO Auto-generated constructor stub
	}

}
