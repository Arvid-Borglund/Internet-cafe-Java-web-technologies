package org.ics.controller;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import javax.persistence.PersistenceException;
import javax.transaction.RollbackException;

public class ErrorHandler {

	public static String generateErrorMessage(Throwable e) {
        if (e instanceof PersistenceException) {
            Throwable cause = e.getCause();

            if (cause instanceof SQLIntegrityConstraintViolationException) {
                return handleSQLIntegrityConstraintViolation((SQLIntegrityConstraintViolationException) cause);
            } else if (cause instanceof RollbackException) {
                Throwable rollbackCause = cause.getCause();

                if (rollbackCause instanceof SQLException) {
                    SQLException sqlException = (SQLException) rollbackCause;
                    if (sqlException.getCause() instanceof SQLIntegrityConstraintViolationException) {
                        return handleSQLIntegrityConstraintViolation((SQLIntegrityConstraintViolationException) sqlException.getCause());
                    }
                }
            }
        }

        // Handle other exceptions
        String errorMessage = "An unexpected error occurred: " + e.getMessage();
        if (errorMessage.contains("ARJUNA016053")) {
            return "The ID (and/or email) already exists. Please choose a different ID (and/or email).";
        } else {
            return errorMessage;
        }
    }

    private static String handleSQLIntegrityConstraintViolation(SQLIntegrityConstraintViolationException cause) {
        int errorCode = cause.getErrorCode();
        switch (errorCode) {
            case 2601: // Microsoft SQL Server's error code for duplicate entry
            case 2627: // Microsoft SQL Server's error code for unique constraint violation
                return "The ID (and/or email) already exists. Please choose a different ID (and/or email).";

            case 547: // Microsoft SQL Server's error code for foreign key constraint violation
                String message = cause.getMessage().toLowerCase();
                if (message.contains("delete") || message.contains("update")) {
                    return "The referenced entity cannot be deleted as it is being used by another entity.";
                } else if (message.contains("insert")) {
                    return "The referenced entity does not exist. Please provide a valid reference.";
                }

            default:
                return "An SQL error occurred: " + cause.getMessage();
        }
    }
}