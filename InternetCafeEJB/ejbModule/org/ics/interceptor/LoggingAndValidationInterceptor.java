package org.ics.interceptor;

import java.util.logging.Logger;
import javax.interceptor.AroundInvoke;
import javax.interceptor.InvocationContext;
import javax.validation.ConstraintViolationException;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

public class LoggingAndValidationInterceptor {

	private static final Logger logger = Logger.getLogger(LoggingAndValidationInterceptor.class.getName());

	@AroundInvoke
	public Object logMethodInvocation(InvocationContext ctx) throws Exception {
		logger.info("Entering method: " + ctx.getMethod().getName());

		// Validate the entity if the method is 'create' or 'update'
		if (ctx.getMethod().getName().equals("create") || ctx.getMethod().getName().equals("update")) {
			Object entity = ctx.getParameters()[0];
			validateEntity(entity);
		}

		Object result = ctx.proceed();
		logger.info("Exiting method: " + ctx.getMethod().getName());
		return result;
	}

	public void validateEntity(Object entity) {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();

		var violations = validator.validate(entity);
		if (!violations.isEmpty()) {
			throw new ConstraintViolationException("Validation failed for entity: " + entity.getClass().getName(),
					violations);
		}

		logger.info("Entity validated: " + entity.getClass().getName());
	}
}
