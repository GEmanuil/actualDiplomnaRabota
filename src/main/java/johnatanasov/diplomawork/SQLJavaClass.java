package johnatanasov.diplomawork;
import com.mysql.jdbc.Driver;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
public class SQLJavaClass {

    private final String dbUrl = "jdbc:mysql://localhost:3306/demo";
    private final String dbUname = "root";
    private final String dbPassword = "c6gkjN9ELV7ZQQxE";
    private final String dbDriver = "com.mysql.cj.jdbc.Driver";

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println();
        }
    }

    public Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return con;
    }

    public void insert(regInfoClass member) {
        loadDriver(dbDriver);
        Connection con = getConnection();
        String sql = "insert into RegTB(Firstname, Lastname, email, password, sOrT) values (?, ?, ?, ?, ?);";

        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);

            ps.setString(1, member.getFirstname());
            ps.setString(2, member.getLastname());
            ps.setString(3, member.getEmail());
            ps.setString(4, member.getPassword());
            ps.setString(5, member.getTeachStud());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public boolean check(regInfoClass member) {
        loadDriver(dbDriver);
        Connection con = getConnection();
        String sql = "SELECT * FROM regtb  WHERE email = ? and password = ?;";

        PreparedStatement ps;
        boolean cheki;

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, member.getEmail());
            ps.setString(2, member.getPassword());
            System.out.println(ps.executeQuery().next() + " ");
            cheki = ps.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
            cheki = false;
        }
        return cheki;
    }

    public void insertContent(String title, String text, HttpSession session){
        String email = session.getAttribute("email").toString();
        String password = session.getAttribute("password").toString();
//        System.out.println("In insertContent fun: " +  session.getAttribute("email"));
        ResultSet resulset;
        String result = null;
        loadDriver(dbDriver);
        Connection con = getConnection();
        String sql = "SELECT ID FROM regtb WHERE email = ? and password = ?;";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            resulset = ps.executeQuery();
            if(resulset.next()){
//                System.out.println(resulset.getString("ID"));
                result = resulset.getString("ID");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        String sql1 = "insert into content(title, text, fid) values(?, ?, ?);";
        PreparedStatement ps1;

        try {
            ps1 = con.prepareStatement(sql1);
            ps1.setString(1, title);
            ps1.setString(2, text);
            ps1.setString(3, result);
            ps1.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public boolean checkOnlyForEmail(regInfoClass member) {
        loadDriver(dbDriver);
        Connection con = getConnection();
        String sql = "SELECT * FROM regtb  WHERE email = ?;";

        PreparedStatement ps;
        boolean chekis;

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, member.getEmail());
            System.out.println(ps.executeQuery().next() + " ");
            chekis = ps.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
            chekis = false;
        }
        return chekis;
    }

    public void updatePassword(String Password, String email){

        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "select ID from regtb where email=?";
        int id = -1;
        // Try block to catch exception/s
        try {
            // SQL command data stored in String datatype
            p = con.prepareStatement(sql);
            p.setString(1, email);

            rs = p.executeQuery();

            while (rs.next()) {

                id = rs.getInt("id");
            }
            System.out.println("In SQL updatePass func: " + id);

            String sql2 = "update regtb set password=? where ID = ?;";

            PreparedStatement ps;
                ps = con.prepareStatement(sql2);
                ps.setString(1, Password);
                ps.setInt(2, id);
                ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
//            ps = con.prepareStatement(sql);
//            ps.setString(1, email);
//            findID = ps.executeQuery().toString();
//            System.out.println(findID);
        }

        public String giveContentTitle(HttpSession session){
            String email = session.getAttribute("email").toString();
            String result = "null";
            loadDriver(dbDriver);
            Connection con = getConnection();
            PreparedStatement p = null;
            ResultSet rs = null;
            String sql = "select ID from regtb where email=?";
            int id = -1;
            try {
                p = con.prepareStatement(sql);
                p.setString(1, email);
                rs = p.executeQuery();
                while (rs.next()) {

                    id = rs.getInt("id");
                }
        }
            catch (SQLException ex) {
                ex.printStackTrace();
            }
            ResultSet rs2 = null;
            String sql2 = "select id from content where fid = ?;";
            int cOFFids = 0;
            int fid = 0;
            try{
                p = con.prepareStatement(sql2);
                p.setInt(1, id);
                rs2 = p.executeQuery();
                while (rs2.next()) {
                    fid = rs2.getInt("id");
                    cOFFids++;
                }
            }catch (SQLException e) {
                e.printStackTrace();
            }
            int[] arr = new int[cOFFids];
            ResultSet rs3 = null;
            int counter = 0;
            try{
                p = con.prepareStatement(sql2);
                p.setInt(1, id);
                rs3 = p.executeQuery();
                while (rs3.next()) {
                    fid = rs3.getInt("id");
                    arr[counter] = fid;
                    counter++;
                }
            }catch (SQLException e) {
                e.printStackTrace();
            }
            int actualID = arr[cOFFids-1];
            ResultSet rs4 = null;
            String sql3 = "select title from content where id = ?;";
            try{
                p = con.prepareStatement(sql3);
                p.setInt(1, actualID);
                rs4 = p.executeQuery();
                while (rs4.next()) {
                    result = rs4.getString("title");
                }
            }catch (SQLException e) {
                e.printStackTrace();
            }
            return  result;
    }
    public String giveContentText(HttpSession session){
        String email = session.getAttribute("email").toString();
        String result = "null";
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "select ID from regtb where email=?";
        int id = -1;
        try {
            p = con.prepareStatement(sql);
            p.setString(1, email);
            rs = p.executeQuery();
            while (rs.next()) {

                id = rs.getInt("id");
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        ResultSet rs2 = null;
        String sql2 = "select id from content where fid = ?;";
        int cOFFids = 0;
        int fid = 0;
        try{
            p = con.prepareStatement(sql2);
            p.setInt(1, id);
            rs2 = p.executeQuery();
            while (rs2.next()) {
                fid = rs2.getInt("id");
                cOFFids++;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        int[] arr = new int[cOFFids];
        ResultSet rs3 = null;
        int counter = 0;
        try{
            p = con.prepareStatement(sql2);
            p.setInt(1, id);
            rs3 = p.executeQuery();
            while (rs3.next()) {
                fid = rs3.getInt("id");
                arr[counter] = fid;
                counter++;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        int actualID = arr[cOFFids-1];
        ResultSet rs4 = null;
        String sql3 = "select text from content where id = ?;";
        try{
            p = con.prepareStatement(sql3);
            p.setInt(1, actualID);
            rs4 = p.executeQuery();
            while (rs4.next()) {
                result = rs4.getString("text");
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return  result;
    }
}


