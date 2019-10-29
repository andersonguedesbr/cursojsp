package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanContato;
import beans.BeanTipoContato;
import connection.SingleConnection;

public class DaoContato {

	private Connection connection;

	public DaoContato() {

		connection = SingleConnection.getConnection();
	}

	public void incluir(BeanContato beanContato) {
		try {

			String sql = "INSERT INTO tblcontato (idusuario, idtipocontato, contato) VALUES (?, ?, ?)";

			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setInt(1, beanContato.getIdUsuario());
			insert.setInt(2, beanContato.getTipoContato().getId());
			insert.setString(3, beanContato.getContato());
			insert.execute();
			connection.commit();

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}

	}

	public List<BeanContato> listar(int idUsuario) throws Exception {

		List<BeanContato> listaContatos = new ArrayList<BeanContato>();

		String sql = "SELECT cont.id as id, tpcont.tipocontato as tipocontato , cont.contato as contato FROM tblcontato as cont "
				+ "INNER JOIN tbltipocontato as tpcont ON cont.idtipocontato = tpcont.id WHERE cont.idusuario = "
				+ idUsuario;

		PreparedStatement select = connection.prepareStatement(sql);
		ResultSet resultSet = select.executeQuery();

		while (resultSet.next()) {

			BeanContato beanContato = new BeanContato();
			BeanTipoContato beanTipoContato = new BeanTipoContato();

			beanContato.setId(resultSet.getLong("id"));
			beanContato.setContato(resultSet.getString("contato"));
			beanTipoContato.setTipoContato(resultSet.getString("tipocontato"));
			beanContato.setTipoContato(beanTipoContato);

			listaContatos.add(beanContato);
		}

		return listaContatos;
	}

	public BeanContato consultarPorId(Long id) throws Exception {

			BeanContato beanContato = new BeanContato();
			BeanTipoContato beanTipoContato = new BeanTipoContato();

			String sql = "SELECT * FROM tblcontato WHERE id = " + id;

			PreparedStatement select = connection.prepareStatement(sql);
			ResultSet resultSet = select.executeQuery();
			
			while(resultSet.next()) {
				beanContato.setId(resultSet.getLong("id"));
				beanContato.setIdUsuario(resultSet.getInt("idusuario"));
				beanContato.setContato(resultSet.getString("contato"));
				beanTipoContato.setId(resultSet.getInt("idtipocontato"));
				beanContato.setTipoContato(beanTipoContato);
			}
			
			return beanContato;
	}

}
