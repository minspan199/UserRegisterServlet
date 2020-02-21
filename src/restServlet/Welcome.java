package restServlet;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.servlet.ServletContext;
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.Context;

@Path("/hello")
public class Welcome {

	@Context
	private ServletContext context;

	@GET
	@Produces(MediaType.TEXT_HTML)
	public String sayHello() {

		String resource = null;
		String pathString = context.getRealPath("/WEB-INF/welcome.html");
		System.out.println(pathString);
		try {

			resource = Files.readString(java.nio.file.Path.of(pathString), StandardCharsets.UTF_8);
			System.out.println(resource);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return resource;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String sayHelloJSON() {
		String resource = null;
		return resource;
	}

	@GET
	@Produces(MediaType.TEXT_XML)
	public String sayHelloHTML() {
		String resource = null;
		return resource;
	}
}
