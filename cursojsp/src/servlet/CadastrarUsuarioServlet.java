package servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.codec.binary.Base64;

import beans.BeanUsuario;
import dao.DaoUsuario;

@WebServlet("/CadastrarUsuarioServlet")
@MultipartConfig
public class CadastrarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuario daoUsuario = new DaoUsuario();

	public CadastrarUsuarioServlet() {
		super();
	}
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		try {
			String acao = request.getParameter("acao");
			String id = request.getParameter("user");

			if (acao.equalsIgnoreCase("novo")) {
				RequestDispatcher view = request.getRequestDispatcher("cadastroUsuario.jsp");
				view.forward(request, response);
			}
			if (acao.equalsIgnoreCase("delete")) {
				daoUsuario.excluirUsuario(id);

				RequestDispatcher view = request.getRequestDispatcher("listarUsuarios.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);

			} else if (acao.equalsIgnoreCase("update")) {

				BeanUsuario beanUsuario = daoUsuario.consultarUsuario(Integer.parseInt(id));

				RequestDispatcher dispatcher = request.getRequestDispatcher("editarUsuario.jsp");
				request.setAttribute("user", beanUsuario);
				dispatcher.forward(request, response);

			} else if (acao.equalsIgnoreCase("listar")) {

				RequestDispatcher view = request.getRequestDispatcher("listarUsuarios.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);

			} else if (acao.equalsIgnoreCase("detalhar")) {

				BeanUsuario beanUsuario = daoUsuario.consultarUsuario(Integer.parseInt(id));

				RequestDispatcher dispatcher = request.getRequestDispatcher("detalharUsuario.jsp");
				request.setAttribute("user", beanUsuario);
				dispatcher.forward(request, response);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			
			// Upload de arquivo
			
				String acao = request.getParameter("acao");
				
				String id = request.getParameter("id");
				String nome = request.getParameter("nome");
				String login = request.getParameter("login");
				String senha = request.getParameter("senha");
				String telefone = request.getParameter("telefone");
				boolean situacao = request.getParameter("situacao") != null;
				String cep = request.getParameter("cep");
				String logradouro = request.getParameter("logradouro");
				String bairro = request.getParameter("bairro");
				String municipio = request.getParameter("municipio");
				String uf = request.getParameter("uf");
				String ibge = request.getParameter("ibge");
				
				BeanUsuario beanUsuario = new BeanUsuario();
				
				beanUsuario.setId(id != null && !id.isEmpty() ? Integer.parseInt(id) : 0);
				beanUsuario.setNome(nome);
				beanUsuario.setLogin(login);
				beanUsuario.setSenha(senha);
				beanUsuario.setTelefone(telefone);
				beanUsuario.setSituacao(situacao);
				beanUsuario.setCep(cep);
				beanUsuario.setLogradouro(logradouro);
				beanUsuario.setBairro(bairro);
				beanUsuario.setMunicipio(municipio);
				beanUsuario.setUf(uf);
				beanUsuario.setIbge(ibge);
				 
				if(ServletFileUpload.isMultipartContent(request)) {
					
					Part imagemFoto = request.getPart("foto");
					
					String fotoBase64 = new Base64().encodeBase64String(converterStreamByte(imagemFoto.getInputStream()));
					
					beanUsuario.setFoto(fotoBase64);
					beanUsuario.setContentType(imagemFoto.getContentType());
					
				}
				
				if (acao.equalsIgnoreCase("pesquisar")) {
					
					RequestDispatcher view = request.getRequestDispatcher("listarUsuarios.jsp");
					request.setAttribute("usuarios", daoUsuario.consultarUsuarios(nome, login, situacao));
					view.forward(request, response);
					
				} else if (acao.equalsIgnoreCase("incluir")) {
					
					if (beanUsuario.isEmpty()) {
						
						RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroUsuario.jsp");
						request.setAttribute("msg", "Preencha todos os campos obrigat�rios.");
						request.setAttribute("user", beanUsuario);
						dispatcher.forward(request, response);
						
					} else if (daoUsuario.isDuplicado(beanUsuario, acao)) {
						
						RequestDispatcher dispatcher = request.getRequestDispatcher("cadastroUsuario.jsp");
						request.setAttribute("msg", "J� existe um usu�rio com o login informado!");
						request.setAttribute("nome", beanUsuario.getNome());
						dispatcher.forward(request, response);
						
					} else {
						
						daoUsuario.incluirUsuario(beanUsuario);
						
					}
					
				} else if (acao.equalsIgnoreCase("editar")) {
					
					if (beanUsuario.isEmpty()) {
						
						RequestDispatcher dispatcher = request.getRequestDispatcher("editarUsuario.jsp");
						request.setAttribute("msg", "Preencha todos os campos obrigat�rios.");
						request.setAttribute("user", beanUsuario);
						dispatcher.forward(request, response);
						
					} else if (daoUsuario.isDuplicado(beanUsuario, acao)) {
						
						RequestDispatcher dispatcher = request.getRequestDispatcher("editarUsuario.jsp");
						request.setAttribute("msg", "J� existe um usu�rio com o login informado!");
						request.setAttribute("user", beanUsuario);
						dispatcher.forward(request, response);
						
					} else {
						
						daoUsuario.editarUsuario(beanUsuario);
					}
				}
				
				RequestDispatcher view = request.getRequestDispatcher("listarUsuarios.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
			
			


		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private byte [] converterStreamByte (InputStream imagem) throws Exception {
		
		ByteArrayOutputStream arrayOutputStream = new ByteArrayOutputStream();
		
		int reads = imagem.read();
		
		while (reads != -1) {
			arrayOutputStream.write(reads);
			reads = imagem.read();
		}
		
		return arrayOutputStream.toByteArray();
	}
}
