package com.giraone.samples.common;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

public class UserInfo
{   	
	String userId;
	String remoteHost;
	String authType;
	Principal principal;

	public UserInfo(HttpServletRequest request)
	{
		this.setUserId(request.getRemoteUser());
		this.setRemoteHost(request.getRemoteHost());
		this.setAuthType(request.getAuthType());
    	
    	final Principal principal = request.getUserPrincipal();
    	this.setPrincipal(principal);    	
	}
	
	public String getUserId()
	{
		return userId;
	}

	public void setUserId(String userId)
	{
		this.userId = userId;
	}

	public String getRemoteHost()
	{
		return remoteHost;
	}

	public void setRemoteHost(String remoteHost)
	{
		this.remoteHost = remoteHost;
	}

	public String getAuthType()
	{
		return authType;
	}

	public void setAuthType(String authType)
	{
		this.authType = authType;
	}

	public Principal getPrincipal()
	{
		return principal;
	}

	public void setPrincipal(Principal principal)
	{
		this.principal = principal;
	}
}
