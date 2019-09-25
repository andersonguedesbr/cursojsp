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

		PreparedStatement select = connection.prepareStatement(sql);
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

	public boolean validarUsuario(String login, String senha) throws Exception {

		String sql = "SELECT  * FROM public.user WHERE login = ? AND senha = ? AND situacao = TRUE";

		PreparedStatement select = connection.prepareStatement(sql);
		select.setString(1, login);
		select.setString(2, senha);
		ResultSet resultSet = select.executeQuery();

		if (resultSet.next()) {
			return true;

		} else {
			return false;

		}
	}

	public void excluirUsuario(String idUser) {

		try {
			String sql = "DELETE FROM public.user WHERE id = " + idUser;

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

	public void editarUsuario(BeanUsuario beanUsuario) {

		try {
			String sql = "UPDATE public.user SET nome = ?, login = ?, senha = ?, situacao = ? WHERE id = ?";

			PreparedStatement update = connection.prepareStatement(sql);
			update.setString(1, beanUsuario.getNome());
			update.setString(2, beanUsuario.getLogin());
			update.setString(3, beanUsuario.getSenha());
			update.setBoolean(4, beanUsuario.isSituacao());
			update.setInt(5, beanUsuario.getId());
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

	public BeanUsuario consultarUsuario(int id) throws Exception {

		BeanUsuario beanUsuario = new BeanUsuario();

		String sql = "SELECT * FROM public.user WHERE id = " + id;
		PreparedStatement select = connection.prepareStatement(sql);
		ResultSet resultSet = select.executeQuery();

		if (resultSet.next()) {
			beanUsuario.setId(resultSet.getInt("id"));
			beanUsuario.setNome(resultSet.getString("nome"));
			beanUsuario.setLogin(resultSet.getString("login"));
			beanUsuario.setSituacao(resultSet.getBoolean("situacao"));

			return beanUsuario;
		}

		return null;

	}

	public List<BeanUsuario> consultarUsuarios(String nome, String login, boolean situacao) throws Exception {

		List<BeanUsuario> listaUsuarios = new ArrayList<BeanUsuario>();

		String sql = "SELECT  * FROM public.user WHERE nome like ? AND login like ? AND situacao = ?";

		PreparedStatement select = connection.prepareStatement(sql);
		select.setString(1, "%" + nome + "%");
		select.setString(2, "%" + login + "%");
		select.setBoolean(3, situacao);

		ResultSet resultSet = select.executeQuery();

		while (resultSet.next()) {

			BeanUsuario beanUsuario = new BeanUsuario();

			beanUsuario.setId(resultSet.getInt("id"));
			beanUsuario.setNome(resultSet.getString("nome"));
			beanUsuario.setLogin(resultSet.getString("login"));
			beanUsuario.setSituacao(resultSet.getBoolean("situacao"));

			listaUsuarios.add(beanUsuario);
		}
		
		return listaUsuarios;
	}

}
