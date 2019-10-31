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
				+ idUsuario + " ORDER BY tipocontato";

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
	
	public void editar(BeanContato beanContato) {
		
		try {
		String sql = "UPDATE tblcontato SET idtipocontato = ?, contato = ? WHERE id = ?";
			PreparedStatement update = connection.prepareStatement(sql);
			update.setInt(1, beanContato.getTipoContato().getId());
			update.setString(2, beanContato.getContato());
			update.setLong(3, beanContato.getId());
			update.executeUpdate();
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
	
	
	public void excluir(Long id) {
		
		try {
		String sql = "DELETE FROM tblcontato WHERE id = " + id;
			PreparedStatement delete = connection.prepareStatement(sql);
			delete.execute();
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
	
	public List<BeanContato> pesquisar(int idUsuario, int idTipoContato, String contato) throws Exception{
		
		List<BeanContato> listaContatos = new ArrayList<BeanContato>();
		
		String sql = "SELECT * FROM tblcontato cont "
					+ "LEFT JOIN tbltipocontato as tpcont ON cont.idtipocontato = tpcont.id WHERE cont.idusuario = ? AND cont.contato LIKE ?";
	
		if (idTipoContato != 0) {
			sql += " AND cont.idtipocontato = ?";
		}
		
		sql += " ORDER BY tpcont.tipocontato";
					
		PreparedStatement select = connection.prepareStatement(sql);
		select.setInt(1, idUsuario);
		select.setString(2, "%"+contato+"%");
		
		if (idTipoContato != 0) {
			select.setInt(3, idTipoContato);
		}
		
		ResultSet resultSet = select.executeQuery();
		
		while (resultSet.next()) {
			BeanContato beanContato = new BeanContato();
			BeanTipoContato beanTipoContato = new BeanTipoContato();
			
			beanContato.setId(resultSet.getLong("id"));
			beanContato.setIdUsuario(resultSet.getInt("idusuario"));
			beanContato.setContato(resultSet.getString("contato"));
			beanTipoContato.setId(resultSet.getInt("idtipocontato"));
			beanTipoContato.setTipoContato(resultSet.getString("tipocontato"));
			beanContato.setTipoContato(beanTipoContato);
			
			listaContatos.add(beanContato);
		}
		
		return listaContatos;
	}

}
