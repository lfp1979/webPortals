package ok3w.filter.cache;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CacheFilter implements Filter {
    private char[] content=null;
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		if(!request.getRequestURI().contains("index"))
		{
			content=null;
			chain.doFilter(req,res);
			return;
		}
		if (content==null) {
			CacheResponseWrapper cacheResponse = new CacheResponseWrapper(response);
			chain.doFilter(request, cacheResponse);
			content = cacheResponse.getCacheWriter().toCharArray();
		}
		String mimeType = req.getServletContext().getMimeType(request.getRequestURI());
		response.setContentType(mimeType);
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(content);
	}
	@Override
	public void destroy() {
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	public char[] getContent() {
		return content;
	}
	public void setContent(char[] content) {
		this.content = content;
	}
}
