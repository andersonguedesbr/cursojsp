package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanContato;
import beans.BeanTipoContato;
import dao.DaoContato;
import dao.DaoTipoContato;
import dao.DaoUsuario;

@WebServlet("/ContatoServlet")
public class ContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoTipoContato daoTipoContato = new DaoTipoContato();
	private DaoContato daoContato = new DaoContato();
	private DaoUsuario daoUsuario = new DaoUsuario();

	public ContatoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		try {
			
			String user = request.getParameter("user");
			String acao = request.getParameter("acao");
			
			request.getSession().setAttribute("user", user);

			if (acao.equalsIgnoreCase("novo")) {

				RequestDispatcher dispatcher = request.getRequestDispatcher("ContatoIncluir.jsp");
				request.setAttribute("tipoContato", daoTipoContato.listar());
				request.setAttribute("user", daoUsuario.consultarUsuario(Integer.valueOf(user)));
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		int id = Integer.parseInt(request.getParameter("id") == null || request.getParameter("id").isEmpty() ? "0" : request.getParameter("id"));
		int idUsuario = Integer.parseInt((String) request.getSession().getAttribute("user"));
		int tipoContato =  Integer.parseInt(request.getParameter("tipoContato") == null || request.getParameter("tipoContato").isEmpty() ? "0" : request.getParameter("tipoContato"));
		String contato = request.getParameter("contato");
		
		BeanContato beanContato = new BeanContato();
		BeanTipoContato beanTipoContato = new BeanTipoContato();
		
		beanContato.setId(id);
		beanContato.setIdUsuario(idUsuario);
		beanContato.setTipoContato(beanTipoContato);
		beanContato.setContato(contato);
		beanTipoContato.setId(tipoContato);
		
		
		if (acao.equalsIgnoreCase("incluir")) {
			
			daoContato.incluir(beanContato);
			
		}
	}

}
