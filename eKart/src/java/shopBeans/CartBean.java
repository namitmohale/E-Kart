/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopBeans;

import java.sql.ResultSet;
import java.util.Vector;
public class CartBean {

    public String p_id;
    public float p_price;
    public String p_header;
    public int p_number;
    ConnDB conn = new ConnDB();
    Convert convert = new Convert();
    Vector cart = null;
    ResultSet rs = null;

    public Vector addCart(String p_id, Vector cart) {
        this.cart = cart;
        String sql = "select ProductPrice,ProductThumb from Product where ProductID='" + p_id + "'";
        rs = conn.doQuery(sql);
        float p_price = 0;
        String p_image = "";
        try {
            if (rs.next()) {
                p_price = rs.getFloat("ProductPrice");
                p_image = rs.getString("ProductThumb");
            }
        } catch (Exception e) {
        }
        this.p_id = p_id;
        this.p_price = p_price;
        this.p_header = p_image;
        this.p_number = 1;
        boolean Flag = true;
        if (cart == null) {
            cart = new Vector();
        } else {
            for (int i = 0; i < cart.size(); i++) {
                CartBean goodsitem = (CartBean) cart.elementAt(i);
                if (goodsitem.p_id.equals(this.p_id)) {
                    goodsitem.p_number++;
                    cart.setElementAt(goodsitem, i);
                    Flag = false;
                }
            }
        }
        if (Flag) {
            cart.addElement(this);
        }
        return cart;
    }

    public int deleteCart(int p_id, Vector cart) {
        int id = p_id;
        this.cart = cart;
        if (cart == null) {
            return 0;
        } else {
            cart.removeElementAt(id);
            return 1;
        }
    }

    public CartBean updateCart(Vector cart, int i, String num) {
        this.cart = cart;
        CartBean goodsitem = (CartBean) cart.elementAt(i);
        String sum1 = num;// 
        if (sum1 != null && sum1 != "") {
            goodsitem.p_number = Integer.parseInt(sum1);
        }
        //sum=sum+goodsitem.p_number*goodsitem.p_price;
        //cart.addElement(goodsitem);
        return goodsitem;
    }
}
