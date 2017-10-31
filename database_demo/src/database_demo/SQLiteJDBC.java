package database_demo;

import java.sql.*;

public class SQLiteJDBC {
	static Connection c = null;
	Statement stmt = null;

	public static void main(String args[]) throws Exception {
		DatabaseConnector dc=new DatabaseConnector();
		String temp ="";
		
		System.out.println("Otoparkimizin baslangýctaki görüntüsü su sekildedir...");
		dc.otoparkiCizdir();
		
		System.out.println("Bizim icin uygun olan yer bulunacaktir...");
		temp = dc.yerBul();
		System.out.println("Bu yer databasede bos olan engelli yeri (( " + temp +" )) olacaktir...");
		System.out.println(temp);
		
		System.out.println("Simdi de bulanan degeri databasede dolduralim ve otoparkin guncel durumuna bakalim... ");
		dc.yeriDoldur(temp); 
		dc.otoparkiCizdir();
		
		System.out.println("Tekrardan bize yer bulmasini isteyelim...");
		temp = dc.yerBul();
		System.out.println("Bulunacak deger (( " + temp +" )) olacaktir...");		
		System.out.println(temp);
		
		System.out.println("Simdi de databasede kayitli olan (( B1 )) blockunu bosaltalim ve otoparkin guncel haline bakalim...");
		dc.yeriBosalt("B1");
		dc.otoparkiCizdir();
	
		dc.c.close();
	}
}
