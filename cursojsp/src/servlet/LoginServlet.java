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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao.equalsIgnoreCase("inicial")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			DaoUsuario daoUsuario = new DaoUsuario();

			String login = request.getParameter("login");
			String senha = request.getParameter("senha");

			if (this.isEmpty(login, senha)) {

				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				request.setAttribute("msg", "Informe o Login e Senha.");
				dispatcher.forward(request, response);

			} else {

				BeanUsuario beanUsuario = daoUsuario.validarUsuario(login, senha);

				if (beanUsuario != null) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
					request.setAttribute("user", beanUsuario);
					dispatcher.forward(request, response);
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
					request.setAttribute("msg", "Credenciais inválidas");
					dispatcher.forward(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private boolean isEmpty(String login, String senha) {

		if (login == null || login.isEmpty() || senha == null || senha.isEmpty()) {

			return true;
		}
		return false;
	}

}
