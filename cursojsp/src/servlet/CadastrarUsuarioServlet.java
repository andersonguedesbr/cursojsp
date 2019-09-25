package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanUsuario;
import dao.DaoUsuario;

@WebServlet("/CadastrarUsuarioServlet")
public class CadastrarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuario daoUsuario = new DaoUsuario();

	public CadastrarUsuarioServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String acao = request.getParameter("acao");
		String id = request.getParameter("user");

		if (acao.equalsIgnoreCase("delete")) {
			daoUsuario.excluirUsuario(id);
			
			try {
				RequestDispatcher view = request.getRequestDispatcher("listarUsuarios.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (acao.equalsIgnoreCase("update")) {

			try {

				BeanUsuario beanUsuario = daoUsuario.consultarUsuario(Integer.parseInt(id));

				RequestDispatcher dispatcher = request.getRequestDispatcher("editarUsuario.jsp");
				request.setAttribute("user", beanUsuario);
				dispatcher.forward(request, response);

				try {
					RequestDispatcher view = request.getRequestDispatcher("listarUsuarios.jsp");
					request.setAttribute("usuarios", daoUsuario.listar());
					view.forward(request, response);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if (acao.equalsIgnoreCase("listar")) {
			
			try {
				RequestDispatcher view = request.getRequestDispatcher("listarUsuarios.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		String id = request.getParameter("id");
		String nome = request.getParameter("nome");
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		boolean situacao = request.getParameter("situacao") != null;

		BeanUsuario beanUsuario = new BeanUsuario();

		beanUsuario.setId(id != null ? Integer.parseInt(id) : 0);
		beanUsuario.setNome(nome);
		beanUsuario.setLogin(login);
		beanUsuario.setSenha(senha);
		beanUsuario.setSituacao(situacao);

		if (acao.equalsIgnoreCase("pesquisar")) {

			try {

				RequestDispatcher view = request.getRequestDispatcher("listarUsuarios.jsp");
				request.setAttribute("usuarios", daoUsuario.consultarUsuarios(nome, login, situacao));
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (acao.equalsIgnoreCase("incluir")) {
			daoUsuario.incluirUsuario(beanUsuario);
		} else if (acao.equalsIgnoreCase("editar")) {
			daoUsuario.editarUsuario(beanUsuario);
		}

		try {

			RequestDispatcher view = request.getRequestDispatcher("listarUsuarios.jsp");
			request.setAttribute("usuarios", daoUsuario.listar());
			view.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
