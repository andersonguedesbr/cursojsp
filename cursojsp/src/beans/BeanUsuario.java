package beans;

public class BeanUsuario {

	private int id;
	private String nome;
	private String login;
	private String senha;
	private boolean situacao;
	private String telefone;
	private String cep;
	private String logradouro;
	private String bairro;
	private String municipio;
	private String uf;
	private String ibge;
 
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

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getMunicipio() {
		return municipio;
	}

	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getIbge() {
		return ibge;
	}

	public void setIbge(String ibge) {
		this.ibge = ibge;
	}

	public boolean isEmpty() {

		if (this.getLogin() == null || this.getLogin().isEmpty() || this.getNome() == null || this.getNome().isEmpty()
				|| this.getSenha() == null || this.getSenha().isEmpty() || this.getTelefone() == null
				|| this.getTelefone().isEmpty() || this.getCep() == null || this.getCep().isEmpty()) {

			return true;
		}

		return false;
	}

}
