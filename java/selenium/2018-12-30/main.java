// Susimportuojame reikalingas bibliotekas

// "By" klasėje yra metaidai leidžiantys naudoti įvairius DOM selektorius
// galime pasiselektinti mūsų testuojamo puslapio DOM elementus pagal id, klasę ir xpath
import org.openqa.selenium.By;

// Webdriver interface'as yra interface'as kurio metodus implementuoja
// ChromeDriver ir kitų browserių driveriai (safari, firefox, t.t.)
// plačiau: https://seleniumhq.github.io/selenium/docs/api/java/org/openqa/selenium/WebDriver.html
import org.openqa.selenium.WebDriver;

// WebElement yra klasė, kurios objektus kursime
// ir jiems priskirsime testuojamo puslapio DOM objektus
import org.openqa.selenium.WebElement;

// ChromeDriver leidžia siųsti komandas Chrome naršyklei
// kiekviena naršyklė turi kiek kitokius protokolus kaip reikia
// su ja bendrauti dėl to naudojame atitinkamas klases atitinkamoms
// naršyklėms
import org.openqa.selenium.chrome.ChromeDriver;

// ExpectedConditions biblioteka, kurioje yra metodai
// patikrinti ar testuojamas puslapis turi tokius elementus
// arba veikia taip kaip mes ir tikėjomės
import org.openqa.selenium.support.ui.ExpectedConditions;

// Dažnai testuojant puslapius, kurie pasiekiami per tinklą turime palaukti
// kol vienas arba kitas elementas užsikraus. WebDriverWait turi patogius metodus,
// kurie mums leidžia palaukti kol elemntas užsikrauna. Tai reiškia, kad mums
// nereikia rašyti patiems savo kodo "laukimo" logikai įgyveninti, galime tiesiog
// pasinaudoti WebDriverWait metaidais
import org.openqa.selenium.support.ui.WebDriverWait;

public class Main {

    public static void main(String[] args) {

        // šmaikščiai pasižymime testo pradžią
        System.out.println("-- LE_TEST--");

        // nurodome programai kur rasti mūsų Chrome driverį
        // čia turėtų būti vieta, kurioje įsikėlėme iš interneto
        // parsisiųstą chromedriver.exe
        System.setProperty("webdriver.chrome.driver","C:\\Users\\mokytojas\\IdeaProjects\\chromedriver.exe");

        // susikuriame ChromeDriver() tipo (a.k.a. klasės)
        // objektą ir jo pagalba atidarome bing.com puslapį
        WebDriver browser=new ChromeDriver();
        browser.get("https://www.bing.com/");

        // formoujame tekstinę užklausą
        String fieldQuery="Baranauskas";

        // liepiame mūsų "browser" objektui laukti
        // kol elementas vardu "q" bus užkrautas
        waitForElementByName(browser,1,"q");

        // naudodami ID DOM selektorių susirandame
        // mus dominantį paieškos lauką
        WebElement searchField=browser.findElement(By.id("sb_form_q"));

        // sendKeys metodas imituoja žmogaus
        // rašymą su klaviatūra. Taigi šioje vietoje
        // tiesiog mūsų sukurtą užklausą įvedame į
        // pagal ID surastą paieškos lauką
        searchField.sendKeys(fieldQuery);

        // laukiame kol sb_form_go elementas užsikraus
        waitForElementById(browser,1,"sb_form_go");

        // susirandame paieškos myggtuką pagal ID
        WebElement paieskosMygtukas=browser.findElement(By.id("sb_form_go"));
        // spaudžiame surastą mygtuką
        paieskosMygtukas.click();
        // laukiame kol <span> elementas su ID "b_tween" užsikraus
        waitForElementByXpath(browser,1,"//*[@id=\"b_tween\"]/span");

        // elementui užsikrovus pasiimame jį į kintamąjį  rezultataiSk
        WebElement rezultataiSk=browser.findElement(By.xpath("//*[@id=\"b_tween\"]/span"));

        // iš mūsų DOM elemento išgauname tekstą su getText() metodu.
        // nereikalingus DOM elemento dalykus pašaliname, ir ištraukiame
        // Integer tipo kintamąjį, jis reprezentuos kiek rezultatų gražino bing.com
        // pagal mūsų užklrauą.
        int skaiciusRezultatu=Integer.parseInt(rezultataiSk.getText()
                .replace(" Rezultatai","")
                .replace(",",""));

        // išspaudiname išvadas apie mūsų užklausos populiarumą
        if (skaiciusRezultatu < 50000)
            System.out.println("Nepopuliarus Baranauskas");
        else if (skaiciusRezultatu>50000)
            System.out.println("Baranauskas geriausias valdytojas !");
        else
            System.out.println("Nepatiktas rezultatas, FAIL");

    }

    // mūsų pačių apsirašomos pagalbinės funkcijos
    // jos visos labai panašios, tiesiog skiriasi selektorių tipai
    // kurie naudojami laukimui. Vienu atveju laukiame elemento pagal jo ID
    // kitu pagal xpath ar classname

    // metodas, kuris leidžia laukti elemento pagal ID
    static private void waitForElementById (WebDriver browser, int timeOutInSec, String id){
        WebDriverWait waitas=new WebDriverWait(browser,timeOutInSec);
        // laukiame su jau sukurtu objektu elemento, kol jis bus būsenoje kai jį galėsime potencialiai paspausti
        waitas.until(ExpectedConditions.elementToBeClickable(By.id(id)));
    }

    // metodas, kuris leidžia laukti elemento pagal Klasės vardą
    static private void waitForElementByClassName (WebDriver browser, int timeOutInSec, String className){
        WebDriverWait waitas=new WebDriverWait(browser,timeOutInSec);
        // laukiame su jau sukurtu objektu elemento, kol jis bus būsenoje kai jį galėsime potencialiai paspausti
        waitas.until(ExpectedConditions.elementToBeClickable(By.className(className)));
    }

    // metodas, kuris leidžia laukti elemento pagal Pavadinimą
    static private void waitForElementByName (WebDriver browser, int timeOutInSec, String Name){
        WebDriverWait waitas=new WebDriverWait(browser,timeOutInSec);
        // laukiame su jau sukurtu objektu elemento, kol jis bus būsenoje kai jį galėsime potencialiai paspausti
        waitas.until(ExpectedConditions.elementToBeClickable(By.name(Name)));
    }

    // metodas, kuris leidžia laukti elemento pagal Xpath užklausą
    static private void waitForElementByXpath (WebDriver browser, int timeOutInSec, String Xpath){
        // susikuriame naują WebDriverWait objektą
        WebDriverWait waitas=new WebDriverWait(browser,timeOutInSec);
        // laukiame su jau sukurtu objektu elemento, kol jis bus būsenoje kai jį galėsime potencialiai paspausti
        waitas.until(ExpectedConditions.elementToBeClickable(By.xpath(Xpath)));
    }
}
