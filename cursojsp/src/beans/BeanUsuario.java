package beans;

public class BeanUsuario {

	private int id;
	private String nome;
	private String login;
	private String senha;
	private boolean situacao;
	private String telefone;

	public BeanUsuario() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public boolean isSituacao() {
		return situacao;
	}

	public void setSituacao(boolean situacao) {
		this.situacao = situacao;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	public boolean isEmpty () {

		if (this.getLogin() == null || this.getLogin().isEmpty() 
				|| this.getNome() == null || this.getNome().isEmpty() 
				|| this.getSenha() == null || this.getSenha().isEmpty() 
				|| this.getTelefone() == null || this.getTelefone().isEmpty()) {
		
			return true;
		}
		
		return false;
	}

}
