import com.xxx.domain.Favorite;
import com.xxx.service.FavoriteService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class test1 {

    @Test
    public void test1()
    {
        String config="/conf/applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(config);
        Favorite favorite=new Favorite();
        favorite.setUserId(1);
        favorite.setContent("fff");
        favorite.setFarUrl("ddd");
        favorite.setFavoriteName("sss");

        FavoriteService favoriteService= (FavoriteService) ac.getBean("favoriteServiceImpl");

        int num=favoriteService.insertFavorite(favorite);
        System.out.println(num);
    }
}
