package service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcConn;
import beans.Profit;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class Service {
	
	private Connection dbconnection;
	private Statement st,st1,st2;
	private ResultSet rs,rs1,rs2;
	private String sql;
	private List list;
	private Profit pf;
	
	public List GetProfit() throws Exception {
		
		list = new ArrayList();
		dbconnection = JdbcConn.getConnection();
		st = (Statement) dbconnection.createStatement();
		st1= (Statement) dbconnection.createStatement();
		st2=(Statement) dbconnection.createStatement();
		
		sql = "select goods_name goodsName,cost_price costPrice,selling_price sellingPrice,goods_id goodsId from goodslist,trading_information where goods_id=trading_goods_id "
				+"group by goods_name,cost_price,selling_price,goods_id;";
		rs=st.executeQuery(sql);
		int temp;
		while(rs.next()){
			pf =new Profit();
			pf.setGoodsName(rs.getString("goodsName"));
			pf.setCostPrice(rs.getInt("costPrice"));
			pf.setSellingPrive(rs.getInt("SellingPrice"));
			pf.setGoodsId(rs.getInt("goodsId"));
			
			temp=0;
			temp=pf.getSellingPrive()-pf.getCostPrice();
			
			sql="select sum(trading_number) sumNum from trading_information where trading_goods_id="+pf.getGoodsId();
			rs1=st1.executeQuery(sql);
			while(rs1.next()){
				pf.setTradingNum(rs1.getInt("sumNum"));
			}
			pf.setPorfit(temp*pf.getTradingNum());
			
			sql ="select count(trading_id) times from trading_information where trading_goods_id ="+pf.getGoodsId();
			rs2=st2.executeQuery(sql);
			while(rs2.next()){
				pf.setTimes(rs2.getInt("times"));	
			}
			
			list.add(pf);
		}
		
		
		return list;
		
		
	}
	

}
