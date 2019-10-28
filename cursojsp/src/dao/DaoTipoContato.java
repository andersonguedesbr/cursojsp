package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanTipoContato;
import connection.SingleConnection;

public class DaoTipoContato {

	private Connection connection;

	public DaoTipoContato() {
		connection = SingleConnection.getConnection();
	}

	public List<BeanTipoContato> listar() throws Exception {

		List<BeanTipoContato> listaTipoContato = new ArrayList<BeanTipoContato>();

		String sql = "SELECT * FROM tbltipocontato ORDER BY tipocontato";
		PreparedStatement select = connection.prepareStatement(sql);
		ResultSet resultSet = select.executeQuery();

		while (resultSet.next()) {
			BeanTipoContato beanTipoContato = new BeanTipoContato();

			beanTipoContato.setId(resultSet.getInt("id"));
			beanTipoContato.setTipoContato(resultSet.getString("tipocontato"));

			listaTipoContato.add(beanTipoContato);
		}

		return listaTipoContato;

	}

	public BeanTipoContato consultarPorId(int id) throws Exception {

		BeanTipoContato beanTipoContato = new BeanTipoContato();

		String sql = "SELECT * FROM tbltipocontato WHERE id = " + id;

		PreparedStatement select = connection.prepareStatement(sql);
		ResultSet resultSet = select.executeQuery();

		while (resultSet.next()) {

			beanTipoContato.setId(resultSet.getInt("id"));
			beanTipoContato.setTipoContato(resultSet.getString("tipocontato"));
		}

		return beanTipoContato;
	}

}
