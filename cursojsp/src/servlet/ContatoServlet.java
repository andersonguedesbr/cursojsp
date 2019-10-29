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

			String acao = request.getParameter("acao");

			if (acao.equalsIgnoreCase("novo")) {
				int user = (int) request.getSession().getAttribute("user");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("ContatoIncluir.jsp");
				request.setAttribute("tipoContato", daoTipoContato.listar());
				request.setAttribute("user", daoUsuario.consultarUsuario(user));
				dispatcher.forward(request, response);

			} else if (acao.equalsIgnoreCase("listar")) {

				int user = Integer.parseInt(request.getParameter("user"));
				request.getSession().setAttribute("user", user);

				RequestDispatcher dispatcher = request.getRequestDispatcher("ContatoListar.jsp");
				request.setAttribute("tipoContato", daoTipoContato.listar());
				request.setAttribute("user",
						daoUsuario.consultarUsuario((int) request.getSession().getAttribute("user")));
				request.setAttribute("contatos", daoContato.listar((int) request.getSession().getAttribute("user")));
				dispatcher.forward(request, response);
			
			} else if (acao.equalsIgnoreCase("editar")) {
				
				int user = (int) request.getSession().getAttribute("user");
				Long idContato = Long.parseLong(request.getParameter("contato"));
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("ContatoEditar.jsp");
				request.setAttribute("tipoContato", daoTipoContato.listar());
				request.setAttribute("user", daoUsuario.consultarUsuario(user));
				request.setAttribute("contatox", daoContato.consultarPorId(idContato));
				dispatcher.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			
			int user = (int) request.getSession().getAttribute("user");
			
			String acao = request.getParameter("acao");
			int id = Integer.parseInt(request.getParameter("id") == null || request.getParameter("id").isEmpty() ? "0"
					: request.getParameter("id"));
			int idUsuario = (int) request.getSession().getAttribute("user");
			int tipoContato = Integer.parseInt(
					request.getParameter("tipoContato") == null || request.getParameter("tipoContato").isEmpty() ? "0"
							: request.getParameter("tipoContato"));
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

			RequestDispatcher dispatcher = request.getRequestDispatcher("ContatoListar.jsp");
			request.setAttribute("tipoContato", daoTipoContato.listar());
			request.setAttribute("user", daoUsuario.consultarUsuario(user));
			request.setAttribute("contatos", daoContato.listar(user));
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
