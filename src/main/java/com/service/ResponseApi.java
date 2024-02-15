package com.service;

public class ResponseApi {

	private String message;
	private int status;
	private String resultMessage;

	public String getResultMessage() {
		return resultMessage;
	}

	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	}

	public ResponseApi(String message, int status, String resultMessage) {
		this.message = message;
		this.status = status;
		this.resultMessage = resultMessage;
	}

	public ResponseApi() {

	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
