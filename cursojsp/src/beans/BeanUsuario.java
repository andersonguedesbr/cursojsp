package beans;

public class BeanUsuario {

	private String login;
	private String senha;

	public BeanUsuario() {
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

	public boolean validarUsuario(String login, String senha) {

		if (login.equalsIgnoreCase("admin") && senha.equalsIgnoreCase("admin")) {
			return true;
		} else {
			return false;
		}
	}

}
