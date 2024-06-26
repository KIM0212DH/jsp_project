package kr.co.jsplec.ex;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequestEvent;
import jakarta.servlet.ServletRequestListener;
import jakarta.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class jsp_8_3_ex1_contextlistenerex
 *
 */
//@WebListener
public class jsp_8_3_ex1_contextlistenerex implements ServletContextListener, ServletRequestListener, HttpSessionListener {

    /**
     * Default constructor. 
     */
    public jsp_8_3_ex1_contextlistenerex() {
        // TODO Auto-generated constructor stub
    }
    
    @PostConstruct
    public void initialize() {
    	System.out.println("PostConstruct initialize");
    }
    
    @PreDestroy
    public void destroy() {
    	System.out.println("PreDestory destroy");
    }
    
    public void init(ServletConfig config) throws ServletException {
		System.out.println("Init");
	}

    @Override
    public void contextInitialized(ServletContextEvent sce)  { 
    	ServletContextListener.super.contextInitialized(sce);
    	System.out.println("contextInitialized");
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce)  { 
    	ServletContextListener.super.contextDestroyed(sce);
    	System.out.println("contextDestroyed");
    }

    public void requestInitialized(ServletRequestEvent sre)  { 
    	System.out.println( "requestInitialized:\t" + sre);
    }

    public void requestDestroyed(ServletRequestEvent sre)  { 
    	System.out.println("requestDestroyed:\t" + sre);
    }
	
}
