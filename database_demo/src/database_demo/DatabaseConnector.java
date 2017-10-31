package database_demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnector {

	Connection c = null;
	Statement stmt = null;

	public DatabaseConnector() throws Exception {
		try {
			Class.forName("org.sqlite.JDBC");
			c = DriverManager.getConnection("jdbc:sqlite:loadstarParkSystem.db");
			c.setAutoCommit(false);
			stmt = c.createStatement();
			System.out.println("Veri tabaný ile baðlantý saðlandý.");

		} catch (Exception e) {
			throw new Exception("Veri Tabaný ile baðlantý saðlanamadý.");
		}
	}

	public String yerBul() {
		String qry = "SELECT block_name FROM block WHERE ozellik='engelli'AND durum='bos';";
		try {
			ResultSet rs = stmt.executeQuery(qry);

			int size = 0;
			String block_name = "";

			while (rs.next()) {
				size = rs.getRow();
				block_name = rs.getString(1);
			}

			if (size != 0) {
				return block_name;
			} else {
				qry = "SELECT block_name, min(yakinlik_derecesi) FROM block WHERE ozellik='normal' AND durum='bos'";
				rs = stmt.executeQuery(qry);
				while (rs.next()) {
					size = rs.getRow();
					block_name = rs.getString(1);
				}
				if (size != 0) {
					return block_name;
				} else {
					return null;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

	public void otoparkiCizdir() {
		String qry = "SELECT durum FROM block";
		try {
			ResultSet rs = stmt.executeQuery(qry);
			String durum = "";
			int sayac = 0;
			System.out.println();
			while (rs.next()) {
				sayac++;
				System.out.print("|");
				durum = rs.getString(1);
				// System.out.print(durum);
				if (durum.equals("bos")) {
					System.out.print("0");
				} else if (durum.equals("dolu")) {
					System.out.print("X");
				} else if (durum.equals("rezerve")) {
					System.out.print("+");
				}
				if (sayac == 8 || sayac == 14) {
					System.out.println("|");
					System.out.print("  ");
				}
				if (sayac == 20) {
					System.out.println("|");
				}
				if (sayac == 4 || sayac == 11 || sayac == 17 || sayac == 24) {
					System.out.print("|  ");
				}
			}
			System.out.println("|");
			System.out.println();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void yeriDoldur(String block_name) {
		String qry = "UPDATE block SET durum='dolu' WHERE block_name='" + block_name + "'";
		try {
			stmt.executeUpdate(qry);
			c.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void yeriBosalt(String block_name) {
		String qry = "UPDATE block SET durum='bos' WHERE block_name='" + block_name + "'";
		try {
			stmt.executeUpdate(qry);
			c.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void deneme() {

		String qry = "SELECT block_name, min(yakinlik_derecesi) FROM block WHERE ozellik='normal' AND durum='bos'";
		try {
			ResultSet rs = stmt.executeQuery(qry);
			rs.next();
			rs.getString(1);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

