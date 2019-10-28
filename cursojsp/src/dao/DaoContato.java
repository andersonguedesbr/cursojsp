package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.BeanContato;
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

}
