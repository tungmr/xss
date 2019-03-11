package com.tungmr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GetCmt {
	public ArrayList<String> getListCmt() {
        ArrayList<String> listCmt = new ArrayList<>();
        Connection conn = JDBCConnection.myConnect();
        String sql = "SELECT * FROM xsscmt";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String cmt;
                cmt = rs.getString("cmt");
                listCmt.add(cmt);
            }
        } catch (Exception e) {
            System.out.println("ko doc duoc");
        }
        return listCmt;
    }
}
