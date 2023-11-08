package jdbc;

import java.io.*;
import java.sql.*;

public class SalaryHistogram {

	public static int[][] generateHistogramTable(int binStart, int binEnd, int numBins) {
		int[][] histogram = new int[numBins][4];
		int interval = (binEnd - binStart) / numBins;

		for (int i = 0; i < numBins; i++) {
			histogram[i][0] = i + 1;
			histogram[i][1] = 0;
			histogram[i][2] = binStart + i * interval;
			histogram[i][3] = binStart + (i + 1) * interval;
		}

		return histogram;

	}

	public static void main(String[] args) {
		
		String user = args[3];
		String password = args[4];
		String dbName = args[5];
		String dbURL = "jdbc:db2://localhost:25000/" + dbName;
		String query = "select salary from employee";
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			System.out.println("DB2 Driver is loaded successfully");
		} catch (Exception e) {
			e.printStackTrace();
		}

		Connection con;
		ResultSet rs;
		PreparedStatement stmt;
		int binStart = Integer.parseInt(args[0]);
		int binEnd = Integer.parseInt(args[1]);
		int numBins = Integer.parseInt(args[2]);
		int binWidth = (binEnd - binStart) / numBins;

		int[][] histogram = generateHistogramTable(binStart, binEnd, numBins);

		try {
			con = DriverManager.getConnection(dbURL, user, password);
			if (con != null) {
				System.out.println("Database connected");
			} else {
				System.out.println("Database connection faialed");
			}

			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();

			if (rs == null) {
				System.out.println("No data retreieved from database");
				return;
			}

			while (rs.next()) {
				int salary = (int) Float.parseFloat(rs.getString("salary"));
				int bin = (salary - binStart) / binWidth;
				if (salary < binEnd && salary >= binStart) {
					System.out.println(salary + " " + binStart + " " + bin);
					histogram[bin][1]++;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("\nbinnun\t\tfrequency\t\tbinstart\t\tbinend\t\t");
		for (int i = 0; i < numBins; i++) {
			System.out.print(histogram[i][0] + "\t\t");
			System.out.print(histogram[i][1] + "\t\t");
			System.out.print(histogram[i][2] + "\t\t");
			System.out.println(histogram[i][3] + "\t\t");
		}

	}
};
