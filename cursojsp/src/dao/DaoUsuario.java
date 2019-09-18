package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanUsuario;
import connection.SingleConnection;

public class DaoUsuario {

	private Connection connection;

	public DaoUsuario() {
		connection = SingleConnection.getConnection();
	}

	public void incluirUsuario(BeanUsuario beanUsuario) {
		try {
			String sql = "INSERT INTO public.user (nome, login, senha, situacao) VALUES (?, ?, ?, ?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, beanUsuario.getNome());
			insert.setString(2, beanUsuario.getLogin());
			insert.setString(3, beanUsuario.getSenha());
			insert.setBoolean(4, beanUsuario.isSituacao());
			insert.execute();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}

	public List<BeanUsuario> listar() throws Exception {
			
			List<BeanUsuario> listaUsuario = new ArrayList<BeanUsuario>();

			String sql = "SELECT * FROM public.user ORDER BY nome";

			PreparedStatement select;
			select = connection.prepareStatement(sql);
			ResultSet resultSet = select.executeQuery();


			while (resultSet.next()) {
				BeanUsuario beanUsuario = new BeanUsuario();
				beanUsuario.setId(resultSet.getInt("id"));
				beanUsuario.setNome(resultSet.getString("nome"));
				beanUsuario.setLogin(resultSet.getString("login"));
				beanUsuario.setSituacao(resultSet.getBoolean("situacao"));

				listaUsuario.add(beanUsuario);
			}

			return listaUsuario;
	}

}
