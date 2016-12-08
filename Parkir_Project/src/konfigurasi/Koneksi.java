package konfigurasi;
import java.sql.*;
import javax.swing.JOptionPane;

public class Koneksi{
    String url, username, password;
    
    public Koneksi(String database){
        this.url="jdbc:mysql://localhost:3306/"+database;
        this.username="root";
        this.password="";
    }
    
    public Connection aktifkan_koneksi(){
        Connection konek=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            konek=DriverManager.getConnection(this.url,this.username,this.password);
        }catch(Exception e){
            JOptionPane.showMessageDialog(null,"Priksa Nama Database, Koneksi Gagal");
            System.out.println("Erornya :"+e);
            System.exit(0);
        }
        return konek;
    }

}
