package restServlet;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
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
	public String sayHello(@QueryParam("name") String name) {

		String resource = null;
		if (name == null) {
			String pathString = context.getRealPath("/WEB-INF/welcome.html");
			System.out.println(pathString);
			try {
				resource = Files.readString(java.nio.file.Path.of(pathString), StandardCharsets.UTF_8);
				System.out.println(resource);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			resource = "<!DOCTYPE html>" + "<html>" + "<head>" + "<meta charset=\"ISO-8859-1\">"
					+ "<title>Welcome</title>" + "</head>" + "<body>" + "	<h1>Hello " + name + "!</h1>"
					+ "</body>\r\n" + "</html>";
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
		String resource = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + "<hello>Hello World</hello>";
		return resource;
	}
}
