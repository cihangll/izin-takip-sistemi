package musteriIslemleri;

import java.sql.PreparedStatement;
import javax.swing.JOptionPane;
import veritabani.VeritabaniBaglantisi;

/**
 *
 * @author byporti
 */
public class PersonelEkle {
    
    private final String personelAd;
    private final String personelSoyad;
    private final String personelTcNo;
    private final String personelSicilNo;
    private final String personelCinsiyet;
    private final String personelDogumTarihi;
    private final String personelSehir;
    
    //Sorguyu işlemek için.
    PreparedStatement ps;
    
    public PersonelEkle(String personelAd, String personelSoyad, 
            String personelTcNo, String personelSicilNo, String personelCinsiyet,
            String personelDogumTarihi, String personelSehir) {
        
        
        this.personelAd = personelAd;
        this.personelSoyad = personelSoyad;
        this.personelTcNo = personelTcNo;
        this.personelSicilNo = personelSicilNo;
        this.personelCinsiyet = personelCinsiyet;
        this.personelDogumTarihi = personelDogumTarihi;
        this.personelSehir = personelSehir;
    }//Constructor Sonu
    
    public boolean personelEkle(PersonelEkle p) {
        
        try {
            
            VeritabaniBaglantisi vb = new VeritabaniBaglantisi();
            vb.baglan();
            
            String sql = "INSERT INTO kisi_bilgi(ad, soyad, tc_no, sicil_no,"
                    + " cinsiyet, dogum_tarihi, sehir) VALUES "
                    + "(?, ?, ?, ?, ?, ?, ?)";
            
            ps = vb.con.prepareStatement(sql);
            ps.setString(1, p.personelAd);
            ps.setString(2, p.personelSoyad);
            ps.setString(3, p.personelTcNo);
            ps.setString(4, p.personelSicilNo);
            ps.setString(5, p.personelCinsiyet);
            ps.setString(6, p.personelDogumTarihi);
            ps.setString(7, p.personelSehir);
            
            // executeQuery demememizin sebebi resultSete aktarma yapmayacağımız için.
            // Sadece sorguyu çalıştırıpma işlemi yapıp çalışma sonucunda true or false
            // değerlerini kontrol ediceğimiz için.
            ps.execute();
            
            //kontrol için sql çıktısını alalım.
            //System.out.println(ps);
            vb.con.close();
            return true;
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "HATA\n" + e);
            return false;
        }// try-catch block sonu
        
    }//personel ekle metodu sonu
    
}// Class Sonu
