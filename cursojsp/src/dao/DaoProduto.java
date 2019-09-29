package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanProduto;
import connection.SingleConnection;

public class DaoProduto {

	private Connection connection;

	public DaoProduto() {
		connection = SingleConnection.getConnection();
	}

	public void incluir(BeanProduto beanProduto) {

		try {
			String sql = "INSERT INTO produto (descricao, quantidade, unidade, valor) VALUES (?, ?, ?, ?)";

			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, beanProduto.getDescricao());
			insert.setInt(2, beanProduto.getQuantidade());
			insert.setString(3, beanProduto.getUnidade());
			insert.setDouble(4, beanProduto.getValor());
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

	public List<BeanProduto> listar() throws Exception {

		List<BeanProduto> listaProdutos = new ArrayList<BeanProduto>();

		String sql = "SELECT * FROM produto";

		PreparedStatement select = connection.prepareStatement(sql);
		ResultSet resultSet = select.executeQuery();

		while (resultSet.next()) {
			BeanProduto beanProduto = new BeanProduto();

			beanProduto.setId(resultSet.getLong("id"));
			beanProduto.setDescricao(resultSet.getString("descricao"));
			beanProduto.setQuantidade(resultSet.getInt("quantidade"));
			beanProduto.setUnidade(resultSet.getString("unidade"));
			beanProduto.setValor(resultSet.getDouble("valor"));

			listaProdutos.add(beanProduto);
		}

		return listaProdutos;

	}

	public List<BeanProduto> pesquisar(Long id, String descricao, String unidade, double valorInicial,
			double valorFinal) throws Exception {

		List<BeanProduto> listaProdutos = new ArrayList<BeanProduto>();

		String sql = "SELECT * FROM produto WHERE descricao like ? AND unidade like ?";
		if (id > 0) {
			sql += " AND id = " + id;
		}
		if (valorInicial > 0) {
			sql += " AND valor >= " + valorInicial;
		}
		if (valorFinal > 0) {
			sql += " AND valor <= " + valorFinal;
		}

		PreparedStatement select = connection.prepareStatement(sql);
		select.setString(1, "%" + descricao + "%");
		select.setString(2, "%" + unidade + "%");

		ResultSet resultSet = select.executeQuery();

		while (resultSet.next()) {
			BeanProduto beanProduto = new BeanProduto();

			beanProduto.setId(resultSet.getLong("id"));
			beanProduto.setDescricao(resultSet.getString("descricao"));
			beanProduto.setQuantidade(resultSet.getInt("quantidade"));
			beanProduto.setUnidade(resultSet.getString("unidade"));
			beanProduto.setValor(resultSet.getDouble("valor"));

			listaProdutos.add(beanProduto);
		}

		return listaProdutos;

	}

	public void editar(BeanProduto beanProduto) {

		try {
			String sql = "UPDATE public.produto SET (descricao, quantidade, unidade, valor) VALUES (?, ?, ?, ?) WHERE id = ?";

			PreparedStatement update;
			update = connection.prepareStatement(sql);
			update.setString(1, beanProduto.getDescricao());
			update.setInt(2, beanProduto.getQuantidade());
			update.setString(3, beanProduto.getUnidade());
			update.setDouble(4, beanProduto.getValor());
			update.setLong(5, beanProduto.getId());

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

	public BeanProduto consultarProduto(Long id) throws Exception {

		BeanProduto beanProduto = new BeanProduto();

		String sql = "SELECT * FROM public.produto WHERE id = " + id;
		PreparedStatement select = connection.prepareStatement(sql);
		ResultSet resultSet = select.executeQuery();

		while (resultSet.next()) {

			beanProduto.setId(resultSet.getLong("id"));
			beanProduto.setDescricao(resultSet.getString("descricao"));
			beanProduto.setQuantidade(resultSet.getInt("quantidade"));
			beanProduto.setUnidade(resultSet.getString("unidade"));
			beanProduto.setValor(resultSet.getDouble("valor"));
		}

		return beanProduto;

	}

}
