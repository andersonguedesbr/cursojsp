package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BeanProduto;
import dao.DaoProduto;

@WebServlet("/ProdutoServlet")
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoProduto daoProduto = new DaoProduto();

	public ProdutoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		try {
			String acao = request.getParameter("acao");
			Long id = Long.parseLong(request.getParameter("id") == null || request.getParameter("id").isEmpty() ? "0"
					: request.getParameter("id"));
			String descricao = request.getParameter("descricao");
			String unidade = request.getParameter("unidade");
			double valorInicial = Double.parseDouble(
					request.getParameter("valorInicial") == null || request.getParameter("valorInicial").isEmpty() ? "0"
							: request.getParameter("valorInicial"));
			double valorFinal = Double.parseDouble(
					request.getParameter("valorFinal") == null || request.getParameter("valorFinal").isEmpty() ? "0"
							: request.getParameter("valorFinal"));

			if (acao.equalsIgnoreCase("novo")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("cadastrarProduto.jsp");
				dispatcher.forward(request, response);

			} else if (acao.equalsIgnoreCase("listar")) {

				RequestDispatcher dispatcher = request.getRequestDispatcher("ProdutoListar.jsp");
				request.setAttribute("produtos", daoProduto.listar());
				dispatcher.forward(request, response);

			} else if (acao.equalsIgnoreCase("pesquisar")) {

				RequestDispatcher dispatcher = request.getRequestDispatcher("ProdutoListar.jsp");
				request.setAttribute("produtos",
						daoProduto.pesquisar(id, descricao, unidade, valorInicial, valorFinal));
				dispatcher.forward(request, response);

			} else if (acao.equalsIgnoreCase("abirEditar")) {

				BeanProduto beanProduto = daoProduto.consultarProduto(id);

				RequestDispatcher dispatcher = request.getRequestDispatcher("produtoEditar.jsp");
				request.setAttribute("prod", beanProduto);
				dispatcher.forward(request, response);
			} else if (acao.equalsIgnoreCase("detalhar")) {

				BeanProduto beanProduto = daoProduto.consultarProduto(id);

				RequestDispatcher dispatcher = request.getRequestDispatcher("produtoDetalhar.jsp");
				request.setAttribute("prod", beanProduto);
				dispatcher.forward(request, response);

			} else if (acao.equalsIgnoreCase("excluir")) {
				daoProduto.excluir(id);

				RequestDispatcher dispatcher = request.getRequestDispatcher("ProdutoListar.jsp");
				request.setAttribute("produtos", daoProduto.listar());
				dispatcher.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		try {
			
			String acao =  request.getParameter("acao");
			String id = request.getParameter("id");
			String descricao = request.getParameter("descricao");
			String quantidade = request.getParameter("quantidade");
			String unidade = request.getParameter("unidade");
			String valor = request.getParameter("valor");
			
			BeanProduto beanProduto = this.retornarBeanProduto(request);
				
			if (acao.equalsIgnoreCase("incluir")) {

				if (this.isEmpty(descricao, quantidade, unidade, valor)) {
				
					RequestDispatcher dispatcher = request.getRequestDispatcher("cadastrarProduto.jsp");
					request.setAttribute("msg", "Preencha todos os campos obrigatórios.");
					request.setAttribute("prod", beanProduto);
					dispatcher.forward(request, response);
				
				} else if (daoProduto.isDuplicado(beanProduto, acao)) {
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("cadastrarProduto.jsp");
					request.setAttribute("msg", "Já existe um registro com a Descrição informada!");
					request.setAttribute("prod", beanProduto);
					dispatcher.forward(request, response);
					
				} else {
					
					daoProduto.incluir(beanProduto);
					
				}
				
			} else if (acao.equalsIgnoreCase("editar")) {
				
				if (this.isEmpty(descricao, quantidade, unidade, valor)) {
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("produtoEditar.jsp");
					request.setAttribute("msg", "Preencha todos os campos obrigatórios.");
					request.setAttribute("prod", beanProduto);
					dispatcher.forward(request, response);
				
				} else if(daoProduto.isDuplicado(beanProduto, acao)) {
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("produtoEditar.jsp");
					request.setAttribute("msg", "Já existe um registro com a Descrição informada!");
					request.setAttribute("prod", beanProduto);
					dispatcher.forward(request, response);
					
				} else {

					daoProduto.editar(beanProduto);
				
				}
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("ProdutoListar.jsp");
			request.setAttribute("produtos", daoProduto.listar());
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private BeanProduto retornarBeanProduto(HttpServletRequest request) {
		
		BeanProduto beanProduto = new BeanProduto();
		
		beanProduto.setId(Long.parseLong(request.getParameter("id") == null || request.getParameter("id").isEmpty() ? "0" : request.getParameter("id")));
		beanProduto.setDescricao(request.getParameter("descricao"));
		beanProduto.setQuantidade(Integer.parseInt(request.getParameter("quantidade") == null || request.getParameter("quantidade").isEmpty() ? "0" : request.getParameter("quantidade")));
		beanProduto.setUnidade(request.getParameter("unidade"));
		beanProduto.setValor(Double.parseDouble(request.getParameter("valor") == null || request.getParameter("valor").isEmpty() ? "0" : request.getParameter("valor") ));
		
		return beanProduto;
	}

	private boolean isEmpty(String descricao, String quantidade, String unidade, String valor) {
		
		if (descricao == null || descricao.isEmpty()
				|| quantidade == null || quantidade.isEmpty()
				|| unidade == null || unidade.isEmpty()
				|| valor == null || valor.isEmpty()) {
			
			return true;
		}
		
		return false;
	}
}
