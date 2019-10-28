package beans;

public class BeanContato {
	
	private long id;
	private int idUsuario;
	BeanTipoContato tipoContato;
	private String contato;
	
	public BeanContato() {
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public BeanTipoContato getTipoContato() {
		return tipoContato;
	}

	public void setTipoContato(BeanTipoContato tipoContato) {
		this.tipoContato = tipoContato;
	}

	public String getContato() {
		return contato;
	}

	public void setContato(String contato) {
		this.contato = contato;
	}


	
}
