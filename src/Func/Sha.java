package Func;
import java.security.*;
public class Sha {

    public String sha256(String pw) {
        String SHA = "";
        MessageDigest sh;
        try
        {
            sh = MessageDigest.getInstance("SHA-256");
            sh.update(pw.getBytes());
            byte byteData[] = sh.digest();
            StringBuffer sb = new StringBuffer();
            for(int i=0; i<byteData.length;i++){
                sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
            }
            return SHA = sb.toString().substring(3,15); //SHA256인코딩 후 중간문자 12개만 추출.
        } catch (NoSuchAlgorithmException e) {
            System.out.println("err");
            e.printStackTrace();
        }
        return SHA;

    }


}
