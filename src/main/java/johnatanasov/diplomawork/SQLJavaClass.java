package johnatanasov.diplomawork;
import sun.net.www.http.HttpCaptureOutputStream;
import javax.servlet.http.*;
import javax.sql.rowset.serial.SerialArray;
import java.awt.*;
import java.net.Inet4Address;
import java.sql.*;
import java.util.*;
import java.util.List;

public class SQLJavaClass {

//    private final String dbUrl = "jdbc:mysql://185.96.254.253:3306/relook";
//    private final String dbUname = "root";
//    private final String dbPassword = "P@ssp0rt";
//    private final String dbDriver = "com.mysql.cj.jdbc.Driver";

    private final String dbUrl = "jdbc:mysql://localhost:3306/demo";
    private final String dbUname = "root";
    private final String dbPassword = "c6gkjN9ELV7ZQQxE";
    private final String dbDriver = "com.mysql.cj.jdbc.Driver";

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
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

        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
    }
    public boolean check(regInfoClass member) {
        loadDriver(dbDriver);
        Connection con = getConnection();
        String sql = "SELECT * FROM RegTB  WHERE email = ? and password = ?;";
        PreparedStatement ps;
        boolean cheki;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, member.getEmail());
            ps.setString(2, member.getPassword());
            cheki = ps.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
            cheki = false;
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return cheki;
    }

    public void insertContent(String title, String text, HttpSession session, String code){
        String email = session.getAttribute("email").toString();
        String password = session.getAttribute("password").toString();
//        System.out.println("In insertContent fun: " +  session.getAttribute("email"));
        ResultSet resulset;
        String result = null;
        loadDriver(dbDriver);
        Connection con = getConnection();
        String sql = "SELECT ID FROM RegTB WHERE email = ? and password = ?;";
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
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }

        String sql1 = "insert into content(title, text, fid, code) values(?, ?, ?, ?);";
        PreparedStatement ps1;

        try {
            ps1 = con.prepareStatement(sql1);
            ps1.setString(1, title);
            ps1.setString(2, text);
            ps1.setString(3, result);
            ps1.setString(4, code);
            ps1.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
    }
    public boolean checkOnlyForEmail(regInfoClass member) {
        loadDriver(dbDriver);
        Connection con = getConnection();
        String sql = "SELECT * FROM RegTB  WHERE email = ?;";

        PreparedStatement ps;
        boolean chekis;

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, member.getEmail());
            chekis = ps.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
            chekis = false;
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return chekis;
    }

    public void updatePassword(String Password, String email){

        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "select ID from RegTB where email=?";
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
            String sql2 = "update RegTB set password=? where ID = ?;";

            PreparedStatement ps;
                ps = con.prepareStatement(sql2);
                ps.setString(1, Password);
                ps.setInt(2, id);
                ps.executeUpdate();

             } catch (SQLException ex) {
            ex.printStackTrace();
            }
            finally {
                try{
                    con.close();
                }
                catch (SQLException a) {
                    a.printStackTrace();
                }
            }
        }

        public String giveLastContentTitle(HttpSession session){
            String email = session.getAttribute("email").toString();
            String result = "null";
            loadDriver(dbDriver);
            Connection con = getConnection();
            PreparedStatement p = null;
            ResultSet rs = null;
            String sql = "select ID from RegTB where email=?";
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
                    try{
                        con.close();
                    }
                    catch (SQLException a) {
                        a.printStackTrace();
                    }

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
                    try{
                        con.close();
                    }
                    catch (SQLException a) {
                        a.printStackTrace();
                    }
            }
            finally {
                try{
                    con.close();
                }
                catch (SQLException a) {
                    a.printStackTrace();
                }
            }
            return  result;
    }
    public String giveLastContentText(HttpSession session){
        String email = session.getAttribute("email").toString();
        String result = "null";
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "select ID from RegTB where email=?";
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
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return  result;
    }

    public HashMap<Integer, String> giveContentTitle(HttpSession session){
        String email = session.getAttribute("email").toString();
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        String sql = "select ID from RegTB where email=?";
        int idCounter = 0;
        int id = -1;
        try {
            p = con.prepareStatement(sql);
            p.setString(1, email);
            rs = p.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                idCounter++;
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        rs2 = null;
        String sql2 = "select title from content where fid = ?;";
        int cOFFids = 0;
        int fid = 0;
        try{
            p = con.prepareStatement(sql2);
            p.setInt(1, id);
            rs2 = p.executeQuery();
            while (rs2.next()) {
                cOFFids++;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        String[] Titles = new String[cOFFids];
        int [] Ids = new int[cOFFids];
        String sQl = "select ID from content where fid = ?;";
        int counter = 0;
        try{
            p = con.prepareStatement(sQl);
            p.setInt(1,id);
            rs2 = p.executeQuery();
            while(rs2.next()){
                Ids[counter] = rs2.getInt("ID");
                counter++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        ResultSet rs3 = null;
        String title = "bruh";
        counter = 0;
        try{
            p = con.prepareStatement(sql2);
            p.setInt(1, id);
            rs3 = p.executeQuery();
            while (rs3.next()) {
                Titles[counter] = rs3.getString("title");
                counter++;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        HashMap<Integer, String> titles = new HashMap<>();
        for(int i = 0; i < cOFFids; i++){
            titles.put(Ids[i], Titles[i]);
        }

        return titles;
    }
    public String giveContentText(int id){
        String result = "null";
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "select text from content where id=?";
        try {
            p = con.prepareStatement(sql);
            p.setInt(1, id);
            rs = p.executeQuery();
            while (rs.next()) {
                result = rs.getString("text");
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return  result;
    }
    public String giveContentTitle(int id){
        String result = "null";
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "select title from content where id=?";
        try {
            p = con.prepareStatement(sql);
            p.setInt(1, id);
            rs = p.executeQuery();
            while (rs.next()) {
                result = rs.getString("title");
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return  result;
    }
    public void updateContent( String title, String text, HttpSession session){
        String email = session.getAttribute("email").toString();
        String password = session.getAttribute("password").toString();
//        System.out.println("In insertContent fun: " +  session.getAttribute("email"));
        int resulset;
        String result = null;
        loadDriver(dbDriver);
        Connection con = getConnection();
        String sql = "UPDATE content set title = ?, text = ? WHERE id = ?;";
        PreparedStatement ps;
        String id = session.getAttribute("id").toString();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, text);
            ps.setInt(3, Integer.parseInt(id));
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
    }
    public void insertTest(String question, String answer, HttpSession session){
        String email = session.getAttribute("email").toString();
        String password = session.getAttribute("password").toString();
        int id = (int) session.getAttribute("id");
//        System.out.println("In insertContent fun: " +  session.getAttribute("email"));
        ResultSet resulset = null;
        String result = null;
        loadDriver(dbDriver);
        Connection con = getConnection();

        String sql2 = "insert into tests(question, answer1, ford) values(?, ?, ?);";
        PreparedStatement ps2;
        try {
            ps2 = con.prepareStatement(sql2);
            ps2.setString(1, question);
            ps2.setString(2, answer);
            ps2.setInt(3, id);
            ps2.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
    }
    public void insertTest(String question,  HttpSession session, String A, String B, String C, String D){
        String email = session.getAttribute("email").toString();
        String password = session.getAttribute("password").toString();
        int id = (int) session.getAttribute("id");
        ResultSet resulset = null;
        String result = null;
        loadDriver(dbDriver);
        Connection con = getConnection();

        String sql2 = "insert into tests(question, ford, answer1, answer2, answer3, answer4) values(?, ?, ?, ?, ?, ?);";
        PreparedStatement ps2;
        try {
            ps2 = con.prepareStatement(sql2);
            ps2.setString(1, question);
            ps2.setInt(2, id);
            ps2.setString(3, A);
            ps2.setString(4, B);
            ps2.setString(5, C);
            ps2.setString(6, D);
            ps2.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
    }
    public HashMap<Integer, String> giveTestTitles(HttpSession session){
        String email = session.getAttribute("email").toString();
        int idForContent = (int) session.getAttribute("id");
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        String sQl = "select question from tests where ford = ?;";
        int counter = 0;
        try{
            p = con.prepareStatement(sQl);
            p.setInt(1,idForContent);
            rs2 = p.executeQuery();
            while(rs2.next()){
                counter++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String[] Titles = new String[counter];

        String sQl1 = "select question from tests where ford = ?;";
        int counter2 = 0;
        try{
            p = con.prepareStatement(sQl1);
            p.setInt(1,idForContent);
            rs2 = p.executeQuery();
            while(rs2.next()){
                Titles[counter2] = rs2.getString("question");
                counter2++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        int[] IDsForQuestions = new int[counter];
        String sQl2 = "select id from tests where ford = ?;";
        counter2 = 0;
        try{
            p = con.prepareStatement(sQl2);
            p.setInt(1,idForContent);
            rs2 = p.executeQuery();
            while(rs2.next()){
                IDsForQuestions[counter2] = rs2.getInt("ID");
                counter2++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }

        HashMap<Integer, String> titlesIds = new HashMap<>();
        for(int i = 0; i < counter; i++){
            titlesIds.put(IDsForQuestions[i], Titles[i]);
        }

        return titlesIds;
    }
    public String[] giveTestAnswers(HttpSession session){
        int idForQuestion = (int) session.getAttribute("idForQuestion");
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs2 = null;
        String[] answers = new String[4];
        String sQl = "select answer1, answer2, answer3, answer4 from tests where ID = ?;";
        try{
            p = con.prepareStatement(sQl);
            p.setInt(1,idForQuestion);
            rs2 = p.executeQuery();
            if(rs2.next()){
                answers[0] = rs2.getString("answer1");
                answers[1] = rs2.getString("answer2");
                answers[2] = rs2.getString("answer3");
                answers[3] = rs2.getString("answer4");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return answers;
    }
    public void updateQuestions(String question, String answer1, String answer2, String answer3, String answer4, HttpSession session){
        int idForQuestion = (int) session.getAttribute("idForQuestion");
        int resulset;
        String result = null;
        loadDriver(dbDriver);
        Connection con = getConnection();
        String sql = "UPDATE tests set question = ?, answer1 = ?, answer2 = ?, answer3 = ?, answer4 = ? WHERE id = ?;";
        PreparedStatement ps;
        String id = session.getAttribute("id").toString();
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, question);
            ps.setString(2, answer1);
            ps.setString(3, answer2);
            ps.setString(4, answer3);
            ps.setString(5, answer4);
            ps.setInt(6, idForQuestion);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
    }
    public void updateQuestion(String question, String answer, HttpSession session){
        int idForQuestion = (int) session.getAttribute("idForQuestion");
        int resulset;
        String result = null;
        loadDriver(dbDriver);
        Connection con = getConnection();
        String sql = "UPDATE tests set question = ?, answer1 = ? WHERE id = ?;";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, question);
            ps.setString(2, answer);
            ps.setInt(3, idForQuestion);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
    }
    public String checkForST(regInfoClass member) {
        loadDriver(dbDriver);
        Connection con = getConnection();
        String sql = "SELECT sOrT FROM RegTB  WHERE email = ? and password = ?;";
        PreparedStatement ps;
        String check = null;
        ResultSet rs;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, member.getEmail());
            ps.setString(2, member.getPassword());
            rs = ps.executeQuery();
            if(rs.next()){
                check = rs.getString("sOrT");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return check;
    }
    public String giveContentCode(int id){
        String result = null;
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "select code from content where id=?";
        try {
            p = con.prepareStatement(sql);
            p.setInt(1, id);
            rs = p.executeQuery();
            while (rs.next()) {
                result = rs.getString("code");
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return  result;
    }

    public String giveContentTitle(String code, HttpSession session){
        String result = null;
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "select title from content where code=?;";
        try {
            p = con.prepareStatement(sql);
            p.setString(1, code);
            rs = p.executeQuery();
            while (rs.next()) {
                result = rs.getString("title");
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        String sql2 = "select fid from content where code=?;";
        int idInRegtbOFContentOwner = 0;
        try {
            p = con.prepareStatement(sql2);
            p.setString(1, code);
            rs = p.executeQuery();
            while (rs.next()) {
                idInRegtbOFContentOwner = rs.getInt("fid");
            }
            session.setAttribute("idInRegtbOFContentOwner", idInRegtbOFContentOwner);
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }


        String sql3 = "select id from content where code=?;";
        int idOfcontent = -1;
        try {
            p = con.prepareStatement(sql3);
            p.setString(1, code);
            rs = p.executeQuery();
            while (rs.next()) {
                idOfcontent = rs.getInt("id");
            }
            session.setAttribute("id", idOfcontent);
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return  result;
    }
    public String giveContentText(String code){
        String result = null;
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "select text from content where code=?";
        try {
            p = con.prepareStatement(sql);
            p.setString(1, code);
            rs = p.executeQuery();
            while (rs.next()) {
                result = rs.getString("text");
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return  result;
    }

    public Integer giveNumberOfQuestions(String code){
        int number = -1;
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "select id from content where code=?";
        try {
            p = con.prepareStatement(sql);
            p.setString(1, code);
            rs = p.executeQuery();
            while (rs.next()) {
                number = rs.getInt("id");
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }

        Integer result = 0;
        String sql2 = "select question from tests where ford=?";
        try {
            p = con.prepareStatement(sql2);
            p.setInt(1, number);
            rs = p.executeQuery();
            while (rs.next()) {
                result++;
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return result;
    }
    public ArrayList<Integer> giveQuestionsIDs(String code){
        int number = -1;
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "select id from content where code=?";
        try {
            p = con.prepareStatement(sql);
            p.setString(1, code);
            rs = p.executeQuery();
            while (rs.next()) {
                number = rs.getInt("id");
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }

        Integer result = 0;
        String sql2 = "select question from tests where ford=?";
        try {
            p = con.prepareStatement(sql2);
            p.setInt(1, number);
            rs = p.executeQuery();
            while (rs.next()) {
                result++;
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        String sql3 = "select ID from tests where ford=?";
        ArrayList<Integer> idsOfquestions = new ArrayList<>(result);
        try {
            p = con.prepareStatement(sql3);
            p.setInt(1, number);
            rs = p.executeQuery();
            while(rs.next()){
                idsOfquestions.add(rs.getInt("ID"));
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return idsOfquestions;
    }

    public String giveTestQuestion(int questionID){
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs = null;
        String sql = "select question from tests where ID=?";
        String result = "Something went wrong!!";
        try {
            p = con.prepareStatement(sql);
            p.setInt(1, questionID);
            rs = p.executeQuery();
            while (rs.next()) {
                result = rs.getString("question");
            }
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return result;
    }
    public String[] giveTestAnswers(int questionID){
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement p = null;
        ResultSet rs2 = null;
        String[] answers = new String[4];
        String sQl = "select answer1, answer2, answer3, answer4 from tests where ID = ?;";
        try{
            p = con.prepareStatement(sQl);
            p.setInt(1,questionID);
            rs2 = p.executeQuery();
            if(rs2.next()){
                answers[0] = rs2.getString("answer1");
                answers[1] = rs2.getString("answer2");
                answers[2] = rs2.getString("answer3");
                answers[3] = rs2.getString("answer4");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return answers;
    }

    public void insertanswersInfo(String answer, HttpSession session){
        Enumeration<String> sesiq = session.getAttributeNames();
        int questionID = (int) session.getAttribute("idToSet");
        int idInRegtbOFContentOwner = (int) session.getAttribute("idInRegtbOFContentOwner");
        int contentId = (int) session.getAttribute("id");
        String emailOfTestMaker = (String) session.getAttribute("email");
        int emailId = 0;
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement ps;
        ResultSet resulset;
        String sql0 = "SELECT ID FROM RegTB WHERE email = ?;";
        try {
            ps = con.prepareStatement(sql0);
            ps.setString(1, emailOfTestMaker);
            resulset = ps.executeQuery();
            if(resulset.next()){
                emailId = resulset.getInt("ID");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(Objects.equals(answer, "answer1") || Objects.equals(answer, "answer2") || Objects.equals(answer, "answer3") || Objects.equals(answer, "answer4")) {
            String sql3 = "SELECT " + answer + " as answer FROM tests WHERE id = ?;";
            try {
                ps = con.prepareStatement(sql3);
                ps.setInt(1, questionID);
                resulset = ps.executeQuery();
                if (resulset.next()) {
                    answer = resulset.getString("answer");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        String sql = "insert into answersInfo(answer, fkeyRegTbContentOwner, fkeyTests, fkeyRegTbTestmaker, fkeyContentId) values (?, ?, ?, ?, ?);";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, answer);
            ps.setInt(2, idInRegtbOFContentOwner);
            ps.setInt(3, questionID);
            ps.setInt(4, emailId);
            ps.setInt(5, contentId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
    }

    public int givepersonId(HttpSession session) {
        String emailOfTestMaker = (String) session.getAttribute("email");
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement ps;
        ResultSet resulset;
        int emailId = 0;
        String sql0 = "SELECT ID FROM RegTB WHERE email = ?;";
        try {
            ps = con.prepareStatement(sql0);
            ps.setString(1, emailOfTestMaker);
            resulset = ps.executeQuery();
            if (resulset.next()) {
                emailId = resulset.getInt("ID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return emailId;
    }
    public String giveAnsweredAnswer(int questioID, HttpSession session){
        int testMaker = (int) session.getAttribute("userID");
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement ps;
        ResultSet resulset;
        String answer = null;
        String sql0 = "SELECT answer FROM answersInfo WHERE fkeyRegTbTestmaker = ? and fkeyTests = ?;";
        try {
            ps = con.prepareStatement(sql0);
            ps.setInt(1, testMaker);
            ps.setInt(2, questioID);
            resulset = ps.executeQuery();
            if (resulset.next()) {
                answer = resulset.getString("answer");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return answer;
    }

    public boolean  checkForMadeTest(HttpSession session){
        int personId = (int) session.getAttribute("userID");
        String currentContentCode = (String) session.getAttribute("code");
        loadDriver(dbDriver);
        Connection con = getConnection();
        String sql = "SELECT fkeyTests FROM answersInfo WHERE fkeyRegTbTestmaker = ?;";
        PreparedStatement ps;
        ResultSet rs;
        boolean cheki = false;
        ArrayList<Integer> allAnsweredQuestios = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, personId);
//                cheki = ps.executeQuery().next();
            rs = ps.executeQuery();
            for (int i = 0; rs.next(); i++){
                allAnsweredQuestios.add(i, rs.getInt("fkeyTests"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            cheki = false;
        }
        if(allAnsweredQuestios.size() < 1){
            cheki = false;
        }
        else {
            int contentID = -1;
            ArrayList<Integer> allMadeContents = new ArrayList<>();
            try {
                String sql2 = "SELECT ford FROM tests WHERE ID in (";
                String temp = "";
                for (int i = 0; i < allAnsweredQuestios.size(); i++) {
                    temp += ",?";
                }
                temp = temp.replaceFirst(",", "");
                temp += ")";
                sql2 = sql2 + temp;
                ps = con.prepareStatement(sql2);

                for (int i = 0; i < allAnsweredQuestios.size(); i++) {
                    ps.setInt(i + 1, allAnsweredQuestios.get(i));
                }
                rs = ps.executeQuery();
                int contentCounter = -1;
                while (rs.next()) {
                    if (contentCounter != rs.getInt("ford")) {
                        allMadeContents.add(rs.getInt("ford"));
                        contentCounter = rs.getInt("ford");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                cheki = false;
            }
            String sql3 = "SELECT ID FROM content WHERE code = ?;";
            int idOfCurrentContent = -1;
            try {
                ps = con.prepareStatement(sql3);
                ps.setString(1, currentContentCode);
                rs = ps.executeQuery();
                if (rs.next()) {
                    idOfCurrentContent = rs.getInt("ID");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                cheki = false;
            }
            finally {
                try{
                    con.close();
                }
                catch (SQLException a) {
                    a.printStackTrace();
                }
            }
            for (int i = 0; i < allMadeContents.size(); i++) {
                if (idOfCurrentContent == allMadeContents.get(i)) {
                    cheki = true;
                }
            }
        }
            return cheki;
    }

    public HashMap<Integer, String> giveNamesOfTestMakers(HttpSession session){
        int contentId = (int) session.getAttribute("id");
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement ps;
        ResultSet rs2;
//        String sql = "SELECT Firstname FROM answersInfo, regtb WHERE fkeyRegTbTestmaker = regtb.ID and fkeyTests = ?;";
//        String sql = "SELECT fkeyRegTbTestmaker FROM content WHERE fkeyContentId = ?;";
//        int checker123 = -1;
//        ArrayList<Integer> testMakers = new ArrayList<>();
//        try {
//            ps = con.prepareStatement(sql);
//            ps.setInt(1, contentId);
//            rs2 = ps.executeQuery();
//            while(rs2.next()){
//                if(checker123 != rs2.getInt("fkeyRegTbTestmaker")) {
//                    checker123 = rs2.getInt("fkeyRegTbTestmaker");
//                    testMakers.add(rs2.getInt("fkeyRegTbTestmaker"));
//                }
//            }
//        }
//        catch (SQLException e) {
//            e.printStackTrace();
//        }

        String sql2 = "SELECT fkeyRegTbTestmaker FROM answersInfo WHERE fkeyContentId = ?;";
        List<Integer> regtbid = new ArrayList<Integer>();
        int testmakerCounter = -1;
        try {
            ps = con.prepareStatement(sql2);
            ps.setInt(1, contentId);
            rs2 = ps.executeQuery();
            while(rs2.next()){
                if(testmakerCounter != rs2.getInt("fkeyRegTbTestmaker")) {
                    regtbid.add(rs2.getInt("fkeyRegTbTestmaker"));
                    testmakerCounter = rs2.getInt("fkeyRegTbTestmaker");
                }
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        String sql3 = "SELECT Firstname FROM RegTB WHERE ID = ?;";
        ArrayList<String> fnames = new ArrayList<>();
        for (Integer integer : regtbid) {
            try {
                ps = con.prepareStatement(sql3);
                ps.setInt(1, integer);
                rs2 = ps.executeQuery();
                while (rs2.next()) {
                    fnames.add(rs2.getString("Firstname"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        HashMap<Integer, String> result = new HashMap<>();
        for (int i = 0; i < regtbid.size(); i++){
            result.put(regtbid.get(i), fnames.get(i));
        }
        System.out.println("Test makers: " + result);
        return result;
    }
    public boolean checkForHasTest(HttpSession session){
        String currentContentCode = (String) session.getAttribute("code");
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql3 = "SELECT ID FROM content WHERE code = ?;";
        boolean cheki = false;
        int idOfCurrentContent = -1;
        try {
            ps = con.prepareStatement(sql3);
            ps.setString(1, currentContentCode);
            rs = ps.executeQuery();
            if(rs.next()) {
                idOfCurrentContent = rs.getInt("ID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql = "SELECT ID FROM tests WHERE ford = ?;";
        ArrayList<Integer> idsOfQuestionsCreated = new ArrayList<>();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, idOfCurrentContent);
            rs = ps.executeQuery();
            while(rs.next()) {
                idsOfQuestionsCreated.add(rs.getInt("ID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        if(idsOfQuestionsCreated.size() < 1){
            cheki = false;
        }
        else{
            cheki = true;
        }
        return cheki;
    }
    public void deleteContent(int id){
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement ps;
        String sql = "delete from answersInfo where fkeyContentId = ?;";
        try{
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        }
        catch (SQLException e){
            e.printStackTrace();
        }

        String sql2 = "delete from tests where ford = ?;";
        try{
            ps = con.prepareStatement(sql2);
            ps.setInt(1, id);
            ps.executeUpdate();
        }
        catch (SQLException e){
            e.printStackTrace();
        }

        String sql3 = "delete from content where id = ?;";
        try{
            ps = con.prepareStatement(sql3);
            ps.setInt(1, id);
            ps.executeUpdate();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
    }
    public String[] givePesrsonFirstLastName(HttpSession session){
        String email = (String) session.getAttribute("email");
        String[] result = new String[2];
        loadDriver(dbDriver);
        Connection con = getConnection();;
        ResultSet resultSet;
        PreparedStatement ps;
        String sql = "select Firstname, Lastname from RegTB where email=?";
        try{
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            resultSet = ps.executeQuery();
            if(resultSet.next()){
                result[0] = resultSet.getString("Firstname");
                result[1] = resultSet.getString("Lastname");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
        return result;
    }
    public void deleteQuestion(int id){
        loadDriver(dbDriver);
        Connection con = getConnection();
        PreparedStatement ps;

        String sql9 = "SET foreign_key_checks = 0";
        try{
            ps = con.prepareStatement(sql9);
            ps.executeUpdate();
        }
        catch (SQLException e){
            e.printStackTrace();
        }

        String sql = "delete from answersInfo where fkeyTests = ?;";
        try{
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        }
        catch (SQLException e){
            e.printStackTrace();
        }

        String sql2 = "delete from tests where id = ?;";
        try{
            ps = con.prepareStatement(sql2);
            ps.setInt(1, id);
            ps.executeUpdate();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        String sql3 = "SET foreign_key_checks = 1";
        try{
            ps = con.prepareStatement(sql3);
            ps.executeUpdate();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            try{
                con.close();
            }
            catch (SQLException a) {
                a.printStackTrace();
            }
        }
    }
}