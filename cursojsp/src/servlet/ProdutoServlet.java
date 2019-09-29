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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {
			String acao = request.getParameter("acao");
			Long id = Long.parseLong(request.getParameter("id") == null || request.getParameter("id").isEmpty() ? "0" : request.getParameter("id"));
			String descricao = request.getParameter("descricao");
			String unidade = request.getParameter("unidade");
			double valorInicial = Double.parseDouble(request.getParameter("valorInicial") == null || request.getParameter("valorInicial").isEmpty() ? "0" : request.getParameter("valorInicial") );
			double valorFinal = Double.parseDouble(request.getParameter("valorFinal") == null || request.getParameter("valorFinal").isEmpty() ? "0" : request.getParameter("valorFinal"));
			
			if (acao.equalsIgnoreCase("novo")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("cadastrarProduto.jsp");
				dispatcher.forward(request, response);
			
			} else if (acao.equalsIgnoreCase("listar")) {
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("ProdutoListar.jsp");
				request.setAttribute("produtos", daoProduto.listar());
				dispatcher.forward(request, response);
				
			
			} else if (acao.equalsIgnoreCase("pesquisar")) {
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("ProdutoListar.jsp");
				request.setAttribute("produtos", daoProduto.pesquisar(id, descricao, unidade, valorInicial, valorFinal));
				dispatcher.forward(request, response);
				
			} else if (acao.equalsIgnoreCase("abirEditar")) {
				
				BeanProduto beanProduto = daoProduto.consultarProduto(id);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("produtoEditar.jsp");
				request.setAttribute("produto", beanProduto);
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
			
			BeanProduto beanProduto = new BeanProduto();
			
			beanProduto.setId(Long.parseLong(request.getParameter("id") == null || request.getParameter("id").isEmpty() ? "0" : request.getParameter("id")));
			beanProduto.setDescricao(request.getParameter("descricao"));
			beanProduto.setQuantidade(Integer.parseInt(request.getParameter("quantidade") == null || request.getParameter("quantidade").isEmpty() ? "0" : request.getParameter("quantidade")));
			beanProduto.setUnidade(request.getParameter("unidade"));
			beanProduto.setValor(Double.parseDouble(request.getParameter("valor") == null || request.getParameter("valor").isEmpty() ? "0" : request.getParameter("valor") ));
			
			if (acao.equalsIgnoreCase("incluir")) {
				daoProduto.incluir(beanProduto);
			} else if (acao.equalsIgnoreCase("editar")) {
				daoProduto.editar(beanProduto);
			}
			
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("ProdutoListar.jsp");
			request.setAttribute("produtos", daoProduto.listar());
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
